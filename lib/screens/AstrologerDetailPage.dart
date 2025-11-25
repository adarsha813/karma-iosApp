import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/profile_provider.dart';
import '../services/secure_astrologer_service.dart';
import '../utils/enterprise_animations.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import '../l10n/app_localizations.dart'; // Add this import

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
    return SecurityShield(
      child: Scaffold(backgroundColor: Colors.grey[50], body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [_buildAppBar(), Expanded(child: _buildContent())],
      ),
    );
  }

  Widget _buildAppBar() {
    final l10n = AppLocalizations.of(context)!;
    return PreferredSize(
      preferredSize: const Size.fromHeight(80), // Adjust height if needed
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withAlpha((0.8 * 255).toInt()),
            ],
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Back button
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),

                const SizedBox(width: 8),

                // Title
                Expanded(
                  child: Text(
                    l10n.astrologerProfileTitle, // Updated
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Share button
                if (_loadState == LoadState.success)
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white.withAlpha((0.9 * 255).toInt()),
                    ),
                    onPressed: _shareProfile,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildContentByState(),
    );
  }

  Widget _buildContentByState() {
    final l10n = AppLocalizations.of(context)!;
    switch (_loadState) {
      case LoadState.loading:
        return const AstrologerDetailShimmer();
      case LoadState.error:
        return EnterpriseErrorWidget(
          message: l10n.failedToLoadAstrologer, // Updated
          onRetry: _loadAstrologerData,
        );
      case LoadState.success:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: _buildSuccessContent(),
        );
    }
  }

  Widget _buildSuccessContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          _buildProfileHeader(),
          const SizedBox(height: 24),

          // Favorite Action
          _buildFavoriteSection(),
          const SizedBox(height: 24),

          // Details Sections
          _buildDetailsSections(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
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
                color: Theme.of(context).primaryColor.withAlpha((0.3 * 255).toInt()),
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
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
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
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
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
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                if (_astrologerData?.reviewCount != null) ...[
                  const SizedBox(width: 4),
                  Text(
                    '(${_astrologerData!.reviewCount!} reviews)',
                    style: TextStyle(color: Colors.grey[600]),
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
                            style: const TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Theme.of(
                            context,
                          ).primaryColor.withAlpha((0.1 * 255).toInt()),
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

  Widget _buildFavoriteSection() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
                            _isFavorite ? Colors.grey[600]! : Colors.white,
                          ),
                        ),
                      )
                      : Icon(
                        _isFavorite
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: _isFavorite ? Colors.amber : Colors.white,
                        size: 24,
                      ),
              label: Text(
                _isFavorite
                    ? l10n.personalAstrologer
                    : l10n.makePersonalAstrologer, // Updated
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: _isFavorite ? Colors.grey[800] : Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isFavorite
                        ? Colors.amber.withAlpha((0.2 * 255).toInt())
                        : Theme.of(context).primaryColor,
                foregroundColor: _isFavorite ? Colors.grey[800] : Colors.white,
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
            l10n.favoriteDescription, // Updated
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSections() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Education & Qualifications
        _buildDetailSection(
          icon: Icons.school_rounded,
          title: l10n.educationQualifications, // Updated
          content: [
            if (_astrologerData?.education != null)
              '🎓 ${_astrologerData!.education!}',
            if (_astrologerData?.qualification != null)
              '📜 ${_astrologerData!.qualification!}',
            if (_astrologerData?.experience != null)
              '⏳ ${_astrologerData!.experience!}',
          ].join('\n'),
        ),
        const SizedBox(height: 20),

        // Bio
        if (_astrologerData?.bio != null && _astrologerData!.bio!.isNotEmpty)
          _buildDetailSection(
            icon: Icons.description_rounded,
            title: l10n.aboutSection, // Updated
            content: _astrologerData!.bio!,
          ),
      ],
    );
  }

  Widget _buildDetailSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
              Icon(icon, color: Theme.of(context).primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
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

    final colors = {
      SnackbarType.success: Colors.green,
      SnackbarType.error: Colors.red,
      SnackbarType.warning: Colors.orange,
      SnackbarType.info: Colors.blue,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500),
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
  const AstrologerDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Profile header shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 150,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Favorite button shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Details shimmer
          ...List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EnterpriseErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const EnterpriseErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
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
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(l10n.retryButton), // Updated
              style: ElevatedButton.styleFrom(
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
