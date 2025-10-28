import 'package:flutter/material.dart';
import '../models/astro_term.dart';
import '../services/analytical_service.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

// Custom logger instance
final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

class AstroTermDetailScreen extends StatefulWidget {
  final AstroTerm term;

  const AstroTermDetailScreen({Key? key, required this.term}) : super(key: key);

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

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        widget.term.term,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: _shareTerm,
          tooltip: 'Share term',
        ),
        IconButton(
          icon: const Icon(Icons.copy_outlined),
          onPressed: _copyToClipboard,
          tooltip: 'Copy details',
        ),
      ],
    );
  }

  Widget _buildTermHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.auto_awesome_outlined,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(height: 12),
          Text(
            widget.term.term,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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

  Widget _buildMeaningSection() {
    if (widget.term.meaning.isEmpty) {
      return _buildEmptyState(
        icon: Icons.help_outline,
        title: 'Meaning Not Available',
        description:
            'The meaning for this astrological term is currently being researched and will be added soon.',
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
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
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.description_outlined,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Meaning',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.term.meaning,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNepaliMeaningSection() {
    final nepaliMeaning = widget.term.meaningNepali ?? '';

    if (nepaliMeaning.isEmpty) {
      return const SizedBox.shrink(); // Don't show if no Nepali meaning
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
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
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.language_outlined,
                    size: 18,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'नेपाली अर्थ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              nepaliMeaning,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.info_outline, size: 20, color: Colors.grey.shade600),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Astrological terminology reference',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
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
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(icon, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
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

      // Open the native share dialog
      await Share.share(
        content,
        subject: 'Astrological Term: ${widget.term.term}',
      );
    } catch (e, stackTrace) {
      _logError('Share failed: $e', stackTrace, context: 'shareTerm');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to share term'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _copyToClipboard() async {
    try {
      final content = _buildClipboardContent();

      // In production, use clipboard package:
      await Clipboard.setData(ClipboardData(text: content));

      _logAnalyticsEvent(
        'astro_term_copied',
        params: {'term': widget.term.term},
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Copied to clipboard!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e, stackTrace) {
      _logError('Copy failed: $e', stackTrace, context: 'copyToClipboard');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to copy to clipboard'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _buildClipboardContent() {
    final buffer = StringBuffer();
    buffer.writeln('🌟 ${widget.term.term}');
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
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _buildAppBar(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildTermHeader(),
              const SizedBox(height: 24),
              _buildMeaningSection(),
              if ((widget.term.meaningNepali ?? '').isNotEmpty) ...[
                const SizedBox(height: 16),
                _buildNepaliMeaningSection(),
              ],
              const SizedBox(height: 16),
              _buildAdditionalInfo(),
              const SizedBox(height: 20),

              // Footer
              Text(
                'Astrological Knowledge Base',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
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
