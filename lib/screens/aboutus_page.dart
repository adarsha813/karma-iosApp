import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../config/environment.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart'; // Add this import
import 'package:url_launcher/url_launcher.dart';

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

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  // Analytics and error reporting
  void _logAnalyticsEvent(String event, {Map<String, dynamic>? params}) {
    if (Environment.isProduction) {
      _logger.i('📊 Analytics: $event - ${params ?? {}}');
      // FirebaseAnalytics.instance.logEvent(name: event, parameters: params);
    }
  }

  Widget _buildHeaderSection(
    AppLocalizations l10n,
    BuildContext context,
    ThemeData theme,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withAlpha((0.8 * 255).toInt()),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary.withAlpha((0.2 * 255).toInt()),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.psychology_outlined,
              size: 40,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.aboutOurCompany,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.aboutCompanyDescription,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionVisionValues(
    AppLocalizations l10n,
    BuildContext context,
    ThemeData theme,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: theme.colorScheme.shadow.withAlpha((0.3 * 255).toInt()),
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mission
            _buildSection(
              icon: Icons.flag_outlined,
              title: l10n.ourMission,
              content: l10n.missionDescription,
              context: context,
              theme: theme,
            ),
            const SizedBox(height: 24),

            // Divider
            Divider(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
              height: 1,
            ),
            const SizedBox(height: 24),

            // Vision
            _buildSection(
              icon: Icons.visibility_outlined,
              title: l10n.ourVision,
              content: l10n.visionDescription,
              context: context,
              theme: theme,
            ),
            const SizedBox(height: 24),

            // Divider
            Divider(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
              height: 1,
            ),
            const SizedBox(height: 24),

            // Values
            _buildSection(
              icon: Icons.favorite_outline,
              title: l10n.ourValues,
              content: l10n.valuesDescription,
              context: context,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    required BuildContext context,
    required ThemeData theme,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha((0.1 * 255).toInt()),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: theme.colorScheme.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(
    AppLocalizations l10n,
    BuildContext context,
    ThemeData theme,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: theme.colorScheme.shadow.withAlpha((0.3 * 255).toInt()),
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(
                      (0.1 * 255).toInt(),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.contact_support_outlined,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  l10n.contactUs,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildContactItem(
              icon: Icons.email_outlined,
              label: l10n.contactEmail,
              onTap: _launchEmail, // Now actually launches email
              context: context,
              theme: theme,
            ),
            const SizedBox(height: 12),
            _buildContactItem(
              icon: Icons.language_outlined,
              label: l10n.contactWebsite,
              onTap: _launchWebsite, // Now actually launches website
              context: context,
              theme: theme,
            ),
            const SizedBox(height: 12),
            _buildContactItem(
              icon: Icons.help_outline,
              label: 'App Version: ${Environment.appVersion}',
              onTap: null,
              context: context,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    required BuildContext context,
    required ThemeData theme,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                onTap != null
                    ? theme.colorScheme.surfaceContainerHighest
                    : null,
            borderRadius: BorderRadius.circular(8),
            border:
                onTap != null
                    ? Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.2),
                    )
                    : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color:
                    onTap != null
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color:
                        onTap != null
                            ? theme.colorScheme.onSurface
                            : theme.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                    fontWeight:
                        onTap != null ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ),
              if (onTap != null) ...[
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _launchEmail() async {
    final email = 'support@karmalifepath.com'; // Replace with your actual email
    final subject = 'Support Request';
    final body = 'Hello, I need help with...';

    // Properly encode the subject and body
    final encodedSubject = Uri.encodeComponent(subject);
    final encodedBody = Uri.encodeComponent(body);

    final emailUri = Uri.parse(
      'mailto:$email?subject=$encodedSubject&body=$encodedBody',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
        _logAnalyticsEvent('email_launched');
      } else {
        _logger.e('Could not launch email: $emailUri');
        _showErrorSnackBar('No email app found');
      }
    } catch (e) {
      _logger.e('Error launching email: $e');
      _showErrorSnackBar('Failed to open email app');
    }
  }

  void _launchWebsite() async {
    final websiteUrl =
        'https://karmalifepath.com'; // Replace with your actual URL
    final uri = Uri.parse(websiteUrl);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        _logAnalyticsEvent('website_launched');
      } else {
        _logger.e('Could not launch website: $websiteUrl');
        _showErrorSnackBar('Could not open website');
      }
    } catch (e) {
      _logger.e('Error launching website: $e');
      _showErrorSnackBar('Failed to open website');
    }
  }

  void _showErrorSnackBar(String message) {
    // You need a BuildContext here - pass it from the calling widget
    // For now, logging. Consider using a scaffold messenger.
    _logger.w(message);
  }

  Widget _buildTeamInfo(
    AppLocalizations l10n,
    BuildContext context,
    ThemeData theme,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: theme.colorScheme.shadow.withAlpha((0.3 * 255).toInt()),
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(
                      (0.1 * 255).toInt(),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.people_outline,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  l10n.ourTeam, // <- localized
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              l10n.teamDescription, // <- localized
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = themeProvider.getCurrentTheme(context);

    // Log analytics when page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logAnalyticsEvent('about_us_page_viewed');
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(l10n.aboutUsTitle),
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeaderSection(l10n, context, theme),
            const SizedBox(height: 24),
            _buildMissionVisionValues(l10n, context, theme),
            const SizedBox(height: 24),
            _buildTeamInfo(l10n, context, theme),
            const SizedBox(height: 24),
            _buildContactInfo(l10n, context, theme),
            const SizedBox(height: 32),

            // Footer
            Text(
              'Made with ❤️ for the astrological community',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
