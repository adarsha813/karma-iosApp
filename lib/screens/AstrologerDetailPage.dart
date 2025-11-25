import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/profile_provider.dart';
import '../services/secure_astrologer_service.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import '../l10n/app_localizations.dart'; // Add this import
import '../providers/theme_provider.dart';

class AstrologerDetailPage extends StatefulWidget {
  final String astrologerId;

  const AstrologerDetailPage({super.key, required this.astrologerId});

  @override
  State<AstrologerDetailPage> createState() => _AstrologerDetailPageState();
}

class _AstrologerDetailPageState extends State<AstrologerDetailPage>
    with TickerProviderStateMixin {
  // State Management
  AstrologerDetail? _astrologerData;
  LoadState _loadState = LoadState.loading;
  bool _isFavorite = false;
  bool _actionInProgress = false;

  // Animation Controllers
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // Security & Analytics
  final List<String> _securityLog = [];
  DateTime? _pageOpenTime;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializePage();
    _logSecurityEvent('PAGE_OPENED', {'astrologerId': widget.astrologerId});
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _fadeController.forward();
    _scaleController.forward();
  }

  void _initializePage() {
    _pageOpenTime = DateTime.now();
    _loadAstrologerData();
  }

  Future<void> _loadAstrologerData() async {
    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    profileProvider.debugTokenState();
    if (!mounted) return;

    setState(() => _loadState = LoadState.loading);

    try {
      final profileProvider = Provider.of<ProfileProvider>(
        context,
        listen: false,
      );

      // ✅ FIX: Use the SAME pattern as your working payment page
      final token = profileProvider.token;
      final userId = profileProvider.userId;

      debugPrint('🔍 Token in AstrologerDetailPage: $token');
      debugPrint('🔍 UserId in AstrologerDetailPage: $userId');

      // ✅ FIX: Add immediate fallback like payment page
      if (token == null || userId == null) {
        debugPrint('❌ Token or UserId is null - loading public data only');

        // Load only public data without authentication
        final astrologerDetail =
            await SecureAstrologerService.getAstrologerDetails(
              widget.astrologerId,
              null, // Force no auth for public data
            );

        if (mounted) {
          setState(() {
            _astrologerData = astrologerDetail;
            _isFavorite = false; // Default when not authenticated
            _loadState = LoadState.success;
          });
        }
        return;
      }

      // ✅ Only proceed with authenticated calls if we have valid token/userId
      final results = await Future.wait([
        SecureAstrologerService.getAstrologerDetails(
          widget.astrologerId,
          token,
        ),
        SecureAstrologerService.getFavoriteStatus(
          userId,
          widget.astrologerId,
          token,
        ),
      ], eagerError: true);

      final astrologerDetail = results[0] as AstrologerDetail;
      final isFavorite = results[1] as bool;

      if (mounted) {
        setState(() {
          _astrologerData = astrologerDetail;
          _isFavorite = isFavorite;
          _loadState = LoadState.success;
        });
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Error in _loadAstrologerData: $e');
      _handleError('Failed to load astrologer details', 'LOAD_ERROR');
      debugPrint('❌ Error in _loadAstrologerData: $stackTrace');
    }
  }

  Future<void> _toggleFavorite() async {
    if (_actionInProgress || !mounted) return;

    final profileProvider = Provider.of<ProfileProvider>(
      context,
      listen: false,
    );
    final userId = profileProvider.userId;
    final token = profileProvider.token;

    // ✅ ADD DEBUGGING
    debugPrint('''
🔄 _toggleFavorite called:
   - User ID: $userId
   - Token: ${token != null ? "✅ Present (length: ${token.length})" : "❌ NULL"}
   - Current Favorite State: $_isFavorite
''');

    if (userId == null || userId.isEmpty) {
      final l10n = AppLocalizations.of(context)!;
      _showSecuritySnackbar(l10n.authenticationRequired);
      return;
    }
    setState(() => _actionInProgress = true);
    _logSecurityEvent('FAVORITE_TOGGLE_ATTEMPT', {
      'userId': userId,
      'astrologerId': widget.astrologerId,
      'currentState': _isFavorite,
    });

    try {
      final newFavoriteState = !_isFavorite;

      final success = await SecureAstrologerService.toggleFavorite(
        userId: userId,
        astrologerId: widget.astrologerId,
        isCurrentlyFavorite: _isFavorite,
        token: token,
      );

      if (success && mounted) {
        setState(() => _isFavorite = newFavoriteState);
        final l10n = AppLocalizations.of(context)!;
        final astrologerName = _astrologerData?.fullName ?? 'Astrologer';

        _showEnterpriseSnackbar(
          message:
              newFavoriteState
                  ? l10n.addedToFavorites(astrologerName)
                  : l10n.removedFromFavorites(astrologerName),
          type: newFavoriteState ? SnackbarType.success : SnackbarType.info,
        );

        _logSecurityEvent('FAVORITE_TOGGLE_SUCCESS', {
          'userId': userId,
          'astrologerId': widget.astrologerId,
          'newState': newFavoriteState,
        });
      } else {
        final l10n = AppLocalizations.of(context)!;
        throw AstrologerException(l10n.toggleFavoriteError, 'TOGGLE_FAILED');
      }
    } on AstrologerException catch (e) {
      _showSecuritySnackbar('Security check failed: ${e.message}');
      _logSecurityEvent('FAVORITE_TOGGLE_ERROR', {
        'error': e.message,
        'code': e.code,
        'userId': userId,
        'astrologerId': widget.astrologerId,
      });
    } catch (e) {
      _showSecuritySnackbar('Network error. Please try again.');
      _logSecurityEvent('FAVORITE_TOGGLE_NETWORK_ERROR', {
        'error': e.toString(),
        'userId': userId,
        'astrologerId': widget.astrologerId,
      });
    } finally {
      if (mounted) {
        setState(() => _actionInProgress = false);
      }
    }
  }

  void _handleError(String message, String errorCode) {
    if (!mounted) return;

    setState(() {
      _loadState = LoadState.error;
    });

    _showEnterpriseSnackbar(
      message: message,
      type: SnackbarType.error,
      action: SnackBarAction(label: 'Retry', onPressed: _loadAstrologerData),
    );
  }

  void _logSecurityEvent(String event, [Map<String, dynamic>? data]) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = {
      'timestamp': timestamp,
      'event': event,
      'page': 'AstrologerDetailPage',
      'astrologerId': widget.astrologerId,
      ...?data,
    };

    _securityLog.add(json.encode(logEntry));

    // In production, send to your security monitoring service
    if (kDebugMode) {
      debugPrint('🔒 SECURITY: $event - ${logEntry.toString()}');
    }

    // Keep only last 100 log entries
    if (_securityLog.length > 100) {
      _securityLog.removeAt(0);
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _logSecurityEvent('PAGE_CLOSED', {
      'duration': DateTime.now().difference(_pageOpenTime!).inSeconds,
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return SecurityShield(
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: _buildAppBar(theme),
        body: _buildBody(theme),
      ),
    );
  }

  Widget _buildBody(ThemeData theme) {
    return SafeArea(child: _buildContent(theme));
  }

  AppBar _buildAppBar(ThemeData theme) {
    // Change return type from Widget to AppBar
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(l10n.astrologerProfileTitle),
      backgroundColor: theme.appBarTheme.backgroundColor,
      foregroundColor: theme.appBarTheme.foregroundColor,
      elevation: 0,
      centerTitle: true,
      actions: [
        if (_loadState == LoadState.success)
          IconButton(
            icon: Icon(Icons.share, color: theme.appBarTheme.foregroundColor),
            onPressed: _shareProfile,
          ),
      ],
    );
  }

  Widget _buildContent(ThemeData theme) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildContentByState(theme),
    );
  }

  Widget _buildContentByState(ThemeData theme) {
    final l10n = AppLocalizations.of(context)!;
    switch (_loadState) {
      case LoadState.loading:
        return AstrologerDetailShimmer(theme: theme);
      case LoadState.error:
        return EnterpriseErrorWidget(
          message: l10n.failedToLoadAstrologer,
          onRetry: _loadAstrologerData,
          theme: theme,
        );
      case LoadState.success:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: _buildSuccessContent(theme),
        );
    }
  }

  Widget _buildSuccessContent(ThemeData theme) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          _buildProfileHeader(theme),
          const SizedBox(height: 24),
          // Favorite Action
          _buildFavoriteSection(theme),
          const SizedBox(height: 24),
          // Details Sections
          _buildDetailsSections(theme),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Column(
        children: [
          // Avatar with professional styling
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.primary.withAlpha((0.3 * 255).toInt()),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.1 * 255).toInt()),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: _astrologerData?.image ?? '',
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Container(
                      color: theme.colorScheme.surfaceVariant,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      color: theme.colorScheme.surfaceVariant,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                fadeInDuration: const Duration(milliseconds: 300),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Name and basic info
          Text(
            _astrologerData?.fullName ?? 'Astrologer',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          // Rating and reviews
          if (_astrologerData?.rating != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  '${_astrologerData!.rating!.toStringAsFixed(1)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                if (_astrologerData?.reviewCount != null) ...[
                  const SizedBox(width: 4),
                  Text(
                    '(${_astrologerData!.reviewCount!} reviews)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
          ],
          // Specialties
          if (_astrologerData?.specialties.isNotEmpty == true) ...[
            Wrap(
              spacing: 8,
              runSpacing: 4,
              alignment: WrapAlignment.center,
              children:
                  _astrologerData!.specialties
                      .map(
                        (specialty) => Chip(
                          label: Text(
                            specialty,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          backgroundColor: theme.colorScheme.primary,
                          visualDensity: VisualDensity.compact,
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildFavoriteSection(ThemeData theme) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: ElevatedButton.icon(
              onPressed: _actionInProgress ? null : _toggleFavorite,
              icon:
                  _actionInProgress
                      ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _isFavorite
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onPrimary,
                          ),
                        ),
                      )
                      : Icon(
                        _isFavorite
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color:
                            _isFavorite
                                ? Colors.amber
                                : theme.colorScheme.onPrimary,
                        size: 24,
                      ),
              label: Text(
                _isFavorite
                    ? l10n.personalAstrologer
                    : l10n.makePersonalAstrologer,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      _isFavorite
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onPrimary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isFavorite
                        ? Colors.amber.withAlpha((0.2 * 255).toInt())
                        : theme.colorScheme.primary,
                foregroundColor:
                    _isFavorite
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      _isFavorite
                          ? BorderSide(
                            color: Colors.amber.withAlpha((0.3 * 255).toInt()),
                            width: 2,
                          )
                          : BorderSide.none,
                ),
                elevation: 2,
                shadowColor: Colors.black.withAlpha((0.1 * 255).toInt()),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.favoriteDescription,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSections(ThemeData theme) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Education & Qualifications
        _buildDetailSection(
          icon: Icons.school_rounded,
          title: l10n.educationQualifications,
          content: [
            if (_astrologerData?.education != null)
              '🎓 ${_astrologerData!.education!}',
            if (_astrologerData?.qualification != null)
              '📜 ${_astrologerData!.qualification!}',
            if (_astrologerData?.experience != null)
              '⏳ ${_astrologerData!.experience!}',
          ].join('\n'),
          theme: theme,
        ),
        const SizedBox(height: 20),
        // Bio
        if (_astrologerData?.bio != null && _astrologerData!.bio!.isNotEmpty)
          _buildDetailSection(
            icon: Icons.description_rounded,
            title: l10n.aboutSection,
            content: _astrologerData!.bio!,
            theme: theme,
          ),
      ],
    );
  }

  Widget _buildDetailSection({
    required IconData icon,
    required String title,
    required String content,
    required ThemeData theme,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  void _shareProfile() {
    if (_astrologerData == null) return;

    final l10n = AppLocalizations.of(context)!;

    final name = _astrologerData!.fullName;
    final education = _astrologerData!.education ?? l10n.notProvided;
    final qualification = _astrologerData!.qualification ?? l10n.notProvided;
    final experience = _astrologerData!.experience ?? l10n.notProvided;

    final message = l10n.shareMessage(
      name,
      education,
      qualification,
      experience,
    );

    Share.share(message, subject: '$name - ${l10n.astrologerProfileTitle}');

    _logSecurityEvent('SHARE_ATTEMPT', {
      'astrologerName': name,
      'sharedFields': ['fullName', 'education', 'qualification', 'experience'],
    });
  }

  void _showEnterpriseSnackbar({
    required String message,
    required SnackbarType type,
    SnackBarAction? action,
  }) {
    if (!mounted) return;

    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    final colors = {
      SnackbarType.success: theme.colorScheme.primary,
      SnackbarType.error: theme.colorScheme.error,
      SnackbarType.warning: Colors.orange,
      SnackbarType.info: theme.colorScheme.secondary,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: colors[type],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        action: action,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _showSecuritySnackbar(String message) {
    _showEnterpriseSnackbar(message: message, type: SnackbarType.error);
  }
}

// Supporting Enums and Widgets
enum LoadState { loading, success, error }

enum SnackbarType { success, error, warning, info }

class AstrologerDetailShimmer extends StatelessWidget {
  final ThemeData theme;

  const AstrologerDetailShimmer({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSimpleProfileShimmer(),
            const SizedBox(height: 24),
            _buildSimpleFavoriteShimmer(),
            const SizedBox(height: 24),
            _buildSimpleDetailsShimmer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleProfileShimmer() {
    return Column(
      children: [
        // Simple circle for avatar
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.surfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        // Simple rectangles for text
        Container(
          width: 200,
          height: 24,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 150,
          height: 16,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleFavoriteShimmer() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildSimpleDetailsShimmer() {
    return Column(
      children: [
        _buildSimpleDetailSection(),
        const SizedBox(height: 16),
        _buildSimpleDetailSection(),
      ],
    );
  }

  Widget _buildSimpleDetailSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 20,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 14,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 14,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

class SecurityShield extends StatelessWidget {
  final Widget child;

  const SecurityShield({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child; // In real implementation, add security wrappers here
  }
}

class AstrologerException implements Exception {
  final String message;
  final String code;

  const AstrologerException(this.message, this.code);

  @override
  String toString() => 'AstrologerException: $message ($code)';
}

class EnterpriseErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final ThemeData theme;

  const EnterpriseErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: Icon(
                Icons.refresh_rounded,
                color: theme.colorScheme.onPrimary,
              ),
              label: Text(
                l10n.retryButton,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
