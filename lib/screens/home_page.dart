import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../localization.dart';
import '../providers.dart';
import '../widgets/animated_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeaderSection(),
            const _AboutSection(),
            const _SkillsSection(),
            const _ProjectsSection(),
            const _CVSection(),
            const _ContactSection(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.black26,
              child: Text(
                t.tr('copyright'),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FAB(
            icon: context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
            tooltip: 'Toggle theme',
            onPressed: () =>
                context.read<ThemeProvider>().toggleTheme(),
          ),
          const SizedBox(height: 8),
          _FAB(
            icon: Icons.translate,
            tooltip: 'Toggle language',
            onPressed: () =>
                context.read<LocaleProvider>().toggleLocale(),
          ),
        ],
      ),
    );
  }
}

class _FAB extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _FAB({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: tooltip,
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return AnimatedSection(
      index: 0,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primary.withValues(alpha: 0.3),
              theme.colorScheme.surface,
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 60),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: const AssetImage('assets/images/profile.png'),
              backgroundColor: theme.colorScheme.primaryContainer,
            ),
            const SizedBox(height: 24),
            Text(
              t.tr('name'),
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              t.tr('title'),
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              t.tr('location'),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIcon(
                  icon: Icons.email_outlined,
                  label: t.tr('email'),
                  url: 'mailto:mahmoudfahmy616572@gmail.com',
                ),
                const SizedBox(width: 16),
                _SocialIcon(
                  icon: Icons.code,
                  label: 'GitHub',
                  url: 'https://github.com/Mahmoudfahmy616572',
                ),
                const SizedBox(width: 16),
                _SocialIcon(
                  icon: Icons.link,
                  label: 'LinkedIn',
                  url: 'https://linkedin.com/in/mahmoud__fahmy',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _SocialIcon({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: IconButton.filled(
        onPressed: () => launchUrl(Uri.parse(url)),
        icon: Icon(icon),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return AnimatedSection(
      index: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Text(t.tr('about_me'), style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Container(width: 60, height: 3, color: theme.colorScheme.primary),
            const SizedBox(height: 24),
            Text(
              t.tr('about_text'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final skills = [
      (t.tr('skill_flutter'), Icons.phone_android),
      (t.tr('skill_dart'), Icons.code),
      (t.tr('skill_firebase'), Icons.storage),
      (t.tr('skill_rest_api'), Icons.api),
      (t.tr('skill_git'), Icons.source),
      (t.tr('skill_ui_ux'), Icons.palette),
    ];

    return AnimatedSection(
      index: 2,
      child: Container(
        width: double.infinity,
        color: theme.colorScheme.surfaceContainerHighest,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Text(t.tr('skills'), style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Container(width: 60, height: 3, color: theme.colorScheme.primary),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: skills
                  .map((s) => Chip(
                        avatar: Icon(s.$2, size: 20),
                        label: Text(s.$1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 800;

    final projects = [
      _Project(
        name: t.tr('project_ship_link'),
        description: t.tr('project_ship_link_desc'),
        imagePath: 'assets/images/ShipLink.png',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/ship_link',
      ),
      _Project(
        name: t.tr('project_sneakers'),
        description: t.tr('project_sneakers_desc'),
        imagePath: 'assets/images/Sneakers.png',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/Sneakers_eCommerce',
      ),
      _Project(
        name: t.tr('project_soundora'),
        description: t.tr('project_soundora_desc'),
        imagePath: 'assets/images/SoundOra.png',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/soundora',
      ),
      _Project(
        name: t.tr('project_minishop'),
        description: t.tr('project_minishop_desc'),
        imagePath: 'assets/images/minishop.jpeg',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/e_commerce',
      ),
    ];

    return AnimatedSection(
      index: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Text(t.tr('projects'), style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Container(width: 60, height: 3, color: theme.colorScheme.primary),
            const SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: projects.map((p) {
                return SizedBox(
                  width: isWide ? 340 : double.infinity,
                  child: _ProjectCard(project: p),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Project {
  final String name;
  final String description;
  final String imagePath;
  final String githubUrl;

  const _Project({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.githubUrl,
  });
}

class _ProjectCard extends StatelessWidget {
  final _Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              project.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: theme.colorScheme.surfaceContainerHighest,
                child: const Center(child: Icon(Icons.image, size: 48)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.tonalIcon(
                  onPressed: () => launchUrl(Uri.parse(project.githubUrl)),
                  icon: const Icon(Icons.code, size: 18),
                  label: Text(t.tr('view_on_github')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CVSection extends StatelessWidget {
  const _CVSection();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return AnimatedSection(
      index: 4,
      child: Container(
        width: double.infinity,
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Text(t.tr('download_cv'), style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Container(width: 60, height: 3, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              t.tr('cv_subtitle'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => launchUrl(Uri.parse(
                'https://raw.githubusercontent.com/mahmoudfahmy616572/My_protfolio/gh-pages/assets/assets/pdfs/my_cv.pdf',
              )),
              icon: const Icon(Icons.download),
              label: Text(t.tr('download_cv_btn')),
              style: FilledButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              t.tr('cv_note'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return AnimatedSection(
      index: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Text(t.tr('contact'), style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Container(width: 60, height: 3, color: theme.colorScheme.primary),
            const SizedBox(height: 24),
            Text(
              t.tr('contact_subtitle'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 24,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _ContactItem(
                  icon: Icons.email_outlined,
                  label: t.tr('email'),
                  value: 'mahmoudfahmy616572@gmail.com',
                  url: 'mailto:mahmoudfahmy616572@gmail.com',
                ),
                _ContactItem(
                  icon: Icons.code,
                  label: 'GitHub',
                  value: '@Mahmoudfahmy616572',
                  url: 'https://github.com/Mahmoudfahmy616572',
                ),
                _ContactItem(
                  icon: Icons.link,
                  label: 'LinkedIn',
                  value: 'Mahmoud Fahmy',
                  url: 'https://linkedin.com/in/mahmoud__fahmy',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String url;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.labelSmall),
                Text(value, style: theme.textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
