import 'package:flutter/material.dart';
import 'package:portfolio/localization.dart';
import 'package:portfolio/screens/demo_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectData {
  final String name;
  final String description;
  final String imagePath;
  final String? githubUrl;
  final String? dashboardUrl;
  final String? dashboardLabel;
  final String? adminDashboardUrl;
  final String? adminDashboardLabel;
  final String? apkUrl;
  final String? driverApkUrl;
  final String? liveDemoUrl;
  final String? driverLiveDemoUrl;
  final String seniority;
  final List<String> techStack;

  const ProjectData({
    required this.name,
    required this.description,
    required this.imagePath,
    this.githubUrl,
    this.dashboardUrl,
    this.dashboardLabel,
    this.adminDashboardUrl,
    this.adminDashboardLabel,
    this.apkUrl,
    this.driverApkUrl,
    this.liveDemoUrl,
    this.driverLiveDemoUrl,
    this.seniority = '',
    this.techStack = const [],
  });
}

class ProjectDetailScreen extends StatelessWidget {
  final ProjectData project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final screenW = MediaQuery.of(context).size.width;
    final isWide = screenW > 800;
    final padding = isWide ? 48.0 : 20.0;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                padding,
                MediaQuery.of(context).padding.top + 12,
                padding,
                12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              border: Border(
                bottom: BorderSide(color: theme.colorScheme.outlineVariant),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor:
                        theme.colorScheme.surfaceContainerHighest,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    project.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(padding),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          project.imagePath,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          cacheWidth: 800,
                          errorBuilder: (_, __, ___) => Container(
                            height: 200,
                            color:
                                theme.colorScheme.surfaceContainerHighest,
                            child:
                                const Icon(Icons.broken_image, size: 48),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        project.name,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        project.description,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          height: 1.7,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.85),
                        ),
                      ),
                      if (project.techStack.isNotEmpty) ...[
                        const SizedBox(height: 28),
                        Text(
                          t.tr('skills'),
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.techStack.map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: theme.colorScheme.primary
                                    .withValues(alpha: 0.1),
                              ),
                              child: Text(
                                tech,
                                style: theme.textTheme.labelMedium
                                    ?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                      const SizedBox(height: 32),
                      ..._buildButtons(context, t, theme),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildButtons(
      BuildContext context, AppLocalizations t, ThemeData theme) {
    final buttons = <Widget>[];

    if (project.liveDemoUrl != null) {
      buttons.add(SizedBox(
        width: double.infinity,
        child: _DetailButton(
          label: project.driverLiveDemoUrl != null
              ? t.tr('user_demo')
              : t.tr('live_demo'),
          icon: Icons.phone_iphone,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DemoScreen(
                url: project.liveDemoUrl!,
                title: project.name,
              ),
            ),
          ),
        ),
      ));
    }

    if (project.driverLiveDemoUrl != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      buttons.add(SizedBox(
        width: double.infinity,
        child: _DetailButton(
          label: t.tr('driver_demo'),
          icon: Icons.local_shipping_outlined,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DemoScreen(
                url: project.driverLiveDemoUrl!,
                title: '${project.name} Driver',
              ),
            ),
          ),
        ),
      ));
    }

    final hasLinks = project.dashboardUrl != null ||
        project.adminDashboardUrl != null ||
        project.apkUrl != null ||
        project.driverApkUrl != null;

    if (hasLinks) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      buttons.add(Row(
        children: [
          if (project.dashboardUrl != null)
            Expanded(
              child: _DetailButton(
                label: project.dashboardLabel ?? 'Web App',
                icon: Icons.language,
                onTap: () =>
                    launchUrl(Uri.parse(project.dashboardUrl!)),
              ),
            ),
          if (project.dashboardUrl != null &&
              (project.adminDashboardUrl != null ||
                  project.apkUrl != null))
            const SizedBox(width: 10),
          if (project.adminDashboardUrl != null)
            Expanded(
              child: _DetailButton(
                label: project.adminDashboardLabel ?? 'Admin',
                icon: Icons.admin_panel_settings,
                onTap: () => launchUrl(
                    Uri.parse(project.adminDashboardUrl!)),
              ),
            ),
          if (project.adminDashboardUrl != null &&
              project.apkUrl != null)
            const SizedBox(width: 10),
          if (project.apkUrl != null)
            Expanded(
              child: _DetailButton(
                label: 'User APK',
                icon: Icons.download,
                onTap: () =>
                    launchUrl(Uri.parse(project.apkUrl!)),
              ),
            ),
        ],
      ));
    }

    if (project.driverApkUrl != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      buttons.add(SizedBox(
        width: double.infinity,
        child: _DetailButton(
          label: 'Driver APK',
          icon: Icons.download,
          onTap: () =>
              launchUrl(Uri.parse(project.driverApkUrl!)),
        ),
      ));
    }

    if (project.githubUrl != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      final readmeUrl = '${project.githubUrl}/blob/main/README.md';
      buttons.add(SizedBox(
        width: double.infinity,
        child: _DetailButton(
          label: t.tr('view_on_github'),
          icon: Icons.open_in_new,
          onTap: () => launchUrl(Uri.parse(readmeUrl)),
        ),
      ));
    }

    return buttons;
  }
}

class _DetailButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _DetailButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
