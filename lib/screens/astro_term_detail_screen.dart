import 'package:flutter/material.dart';
import '../models/astro_term.dart';
import '../services/analytical_service.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

// Custom logger instance
final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

class AstroTermDetailScreen extends StatefulWidget {
  final AstroTerm term;

  const AstroTermDetailScreen({super.key, required this.term});

  @override
  State<AstroTermDetailScreen> createState() => _AstroTermDetailScreenState();
}

class _AstroTermDetailScreenState extends State<AstroTermDetailScreen> {
  // Analytics and error reporting
  void _logAnalyticsEvent(String event, {Map<String, dynamic>? params}) {
    if (Environment.isProduction) {
      _logger.i('📊 Analytics: $event - ${params ?? {}}');
      AnalyticsService.logEvent(event, parameters: params);
    }
  }

  void _logError(String error, StackTrace stackTrace, {String? context}) {
    _logger.e(
      '🚨 Error: $error - Context: $context',
      error: error,
      stackTrace: stackTrace,
    );

    if (Environment.isProduction) {
      AnalyticsService.logError(
        error,
        stackTrace: stackTrace,
        context: 'AstroTermDetailScreen: $context',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logAnalyticsEvent(
        'astro_term_detail_viewed',
        params: {
          'term': widget.term.term,
          'has_meaning': widget.term.meaning.isNotEmpty,
          'has_nepali_meaning': (widget.term.meaningNepali ?? '').isNotEmpty,
          'term_length': widget.term.term.length,
        },
      );
    });
  }

  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      title: Text(
        widget.term.term,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.appBarTheme.foregroundColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      backgroundColor: theme.appBarTheme.backgroundColor,
      foregroundColor: theme.appBarTheme.foregroundColor,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.share_outlined,
            color: theme.appBarTheme.foregroundColor,
          ),
          onPressed: _shareTerm,
          tooltip: 'Share term',
        ),
        IconButton(
          icon: Icon(
            Icons.copy_outlined,
            color: theme.appBarTheme.foregroundColor,
          ),
          onPressed: _copyToClipboard,
          tooltip: 'Copy details',
        ),
      ],
    );
  }

  Widget _buildTermHeader(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withAlpha((0.8 * 255).toInt()),
            theme.colorScheme.primary.withAlpha((0.6 * 255).toInt()),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.auto_awesome_outlined,
            size: 40,
            color: theme.colorScheme.onPrimary,
          ),
          const SizedBox(height: 12),
          Text(
            widget.term.term,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMeaningSection(ThemeData theme) {
    if (widget.term.meaning.isEmpty) {
      return _buildEmptyState(
        icon: Icons.help_outline,
        title: 'Meaning Not Available',
        description:
            'The meaning for this astrological term is currently being researched and will be added soon.',
        theme: theme,
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: theme.colorScheme.surface,
      shadowColor: Colors.black.withAlpha((0.1 * 255).toInt()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(
                      (0.1 * 255).toInt(),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.description_outlined,
                    size: 18,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Meaning',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.term.meaning,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNepaliMeaningSection(ThemeData theme) {
    final nepaliMeaning = widget.term.meaningNepali ?? '';

    if (nepaliMeaning.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: theme.colorScheme.surface,
      shadowColor: Colors.black.withAlpha((0.1 * 255).toInt()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withAlpha(
                      (0.1 * 255).toInt(),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.language_outlined,
                    size: 18,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'नेपाली अर्थ',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              nepaliMeaning,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo(ThemeData theme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      color: theme.colorScheme.surfaceContainerHighest,
      shadowColor: Colors.black.withAlpha((0.05 * 255).toInt()),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              size: 20,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Astrological terminology reference',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String description,
    required ThemeData theme,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      color: theme.colorScheme.surface,
      shadowColor: Colors.black.withAlpha((0.1 * 255).toInt()),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareTerm() async {
    try {
      _logAnalyticsEvent(
        'astro_term_shared',
        params: {'term': widget.term.term},
      );

      final content = _buildClipboardContent();
      await Share.share(
        content,
        subject: 'Astrological Term: ${widget.term.term}',
      );
    } catch (e, stackTrace) {
      _logError('Share failed: $e', stackTrace, context: 'shareTerm');

      if (mounted) {
        final themeProvider = Provider.of<ThemeProvider>(
          context,
          listen: false,
        );
        final theme = themeProvider.getCurrentTheme(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to share term',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onError,
              ),
            ),
            backgroundColor: theme.colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _copyToClipboard() async {
    try {
      final content = _buildClipboardContent();
      await Clipboard.setData(ClipboardData(text: content));

      _logAnalyticsEvent(
        'astro_term_copied',
        params: {'term': widget.term.term},
      );

      if (mounted) {
        final themeProvider = Provider.of<ThemeProvider>(
          context,
          listen: false,
        );
        final theme = themeProvider.getCurrentTheme(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Copied to clipboard!',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            backgroundColor: theme.colorScheme.primary,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e, stackTrace) {
      _logError('Copy failed: $e', stackTrace, context: 'copyToClipboard');

      if (mounted) {
        final themeProvider = Provider.of<ThemeProvider>(
          context,
          listen: false,
        );
        final theme = themeProvider.getCurrentTheme(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to copy to clipboard',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onError,
              ),
            ),
            backgroundColor: theme.colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  String _buildClipboardContent() {
    final buffer = StringBuffer();
    buffer.writeln(' ${widget.term.term}');
    buffer.writeln();

    if (widget.term.meaning.isNotEmpty) {
      buffer.writeln('Meaning:');
      buffer.writeln(widget.term.meaning);
      buffer.writeln();
    }

    if ((widget.term.meaningNepali ?? '').isNotEmpty) {
      buffer.writeln('नेपाली अर्थ:');
      buffer.writeln(widget.term.meaningNepali);
      buffer.writeln();
    }

    buffer.writeln('---');
    buffer.writeln('Shared from Astrology App');

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.getCurrentTheme(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: _buildAppBar(theme),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildTermHeader(theme),
              const SizedBox(height: 24),
              _buildMeaningSection(theme),
              if ((widget.term.meaningNepali ?? '').isNotEmpty) ...[
                const SizedBox(height: 16),
                _buildNepaliMeaningSection(theme),
              ],
              const SizedBox(height: 16),
              _buildAdditionalInfo(theme),
              const SizedBox(height: 20),
              // Footer
              Text(
                'Astrological Knowledge Base',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
