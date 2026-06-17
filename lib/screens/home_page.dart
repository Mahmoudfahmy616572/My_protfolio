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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeaderSection(),
            const _StatsBar(),
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
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
          const SizedBox(height: 8),
          _FAB(
            icon: Icons.translate,
            tooltip: 'Toggle language',
            onPressed: () => context.read<LocaleProvider>().toggleLocale(),
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
              theme.colorScheme.primary.withValues(alpha: 0.25),
              theme.colorScheme.surface,
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 60),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.4),
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                radius: 68,
                backgroundImage:
                    const AssetImage('assets/images/profile.png'),
                backgroundColor: theme.colorScheme.primaryContainer,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              t.tr('name'),
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.colorScheme.primary.withValues(alpha: 0.15),
              ),
              child: Text(
                t.tr('title'),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                const SizedBox(width: 4),
                Text(
                  t.tr('location'),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialButton(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  url: 'mailto:mahmoudfahmy616572@gmail.com',
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  icon: Icons.code,
                  label: 'GitHub',
                  url: 'https://github.com/Mahmoudfahmy616572',
                ),
                const SizedBox(width: 12),
                _SocialButton(
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

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.12 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Tooltip(
          message: widget.label,
          child: IconButton.filled(
            onPressed: () => launchUrl(Uri.parse(widget.url)),
            icon: Icon(widget.icon),
          ),
        ),
      ),
    );
  }
}

class _StatsBar extends StatelessWidget {
  const _StatsBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: theme.colorScheme.primary.withValues(alpha: 0.08),
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: AnimatedSection(
        index: 1,
        child: Wrap(
          spacing: 32,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _StatItem(
              icon: Icons.phone_android,
              value: '8+',
              label: 'Flutter Apps',
            ),
            _StatItem(
              icon: Icons.store,
              value: '5K+',
              label: 'Google Play Downloads',
            ),
            _StatItem(
              icon: Icons.code,
              value: '14',
              label: 'GitHub Repos',
            ),
            _StatItem(
              icon: Icons.work_outline,
              value: '2+',
              label: 'Years Experience',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: theme.colorScheme.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
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
      index: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            _SectionHeader(title: t.tr('about_me')),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                t.tr('about_text'),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.7,
                  color:
                      theme.colorScheme.onSurface.withValues(alpha: 0.85),
                ),
              ),
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
      index: 3,
      child: Container(
        width: double.infinity,
        color: theme.colorScheme.surfaceContainerHighest,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            _SectionHeader(title: t.tr('skills')),
            const SizedBox(height: 28),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: skills
                  .map((s) => Chip(
                        avatar: Icon(s.$2, size: 20),
                        label: Text(s.$1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        side: BorderSide.none,
                        backgroundColor: theme.colorScheme.primary
                            .withValues(alpha: 0.12),
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
        githubUrl:
            'https://github.com/Mahmoudfahmy616572/Sneakers_eCommerce',
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
      index: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            _SectionHeader(title: t.tr('projects')),
            const SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: projects.asMap().entries.map((entry) {
                return SizedBox(
                  width: isWide ? 340 : double.infinity,
                  child: _ProjectCard(
                    project: entry.value,
                    index: entry.key,
                  ),
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
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;

  const _Project({
    required this.name,
    required this.description,
    required this.imagePath,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
  });
}

class _ProjectCard extends StatelessWidget {
  final _Project project;
  final int index;

  const _ProjectCard({required this.project, required this.index});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return AnimatedStaggeredCard(
      index: index,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    project.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: const Center(
                          child: Icon(Icons.image, size: 48)),
                    ),
                  ),
                ),
                if (project.playStoreUrl != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle,
                              size: 14, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            'Published',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface
                          .withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (project.playStoreUrl != null) ...[
                    Row(
                      children: [
                        Icon(Icons.store,
                            size: 16,
                            color: theme.colorScheme.primary),
                        const SizedBox(width: 6),
                        Text(
                          t.tr('lives_on'),
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _StoreBadge(
                            label: 'Google Play',
                            icon: Icons.play_circle_outline,
                            onTap: () => launchUrl(
                                Uri.parse(project.playStoreUrl!)),
                          ),
                        ),
                        if (project.appStoreUrl != null)
                          const SizedBox(width: 8),
                        if (project.appStoreUrl != null)
                          Expanded(
                            child: _StoreBadge(
                              label: 'App Store',
                              icon: Icons.apple,
                              onTap: () => launchUrl(
                                  Uri.parse(project.appStoreUrl!)),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  Row(
                    children: [
                      Icon(Icons.code,
                          size: 16,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.5)),
                      const SizedBox(width: 6),
                      TextButton.icon(
                        onPressed: () => launchUrl(
                            Uri.parse(project.githubUrl!)),
                        icon: const Icon(Icons.open_in_new, size: 16),
                        label: Text(t.tr('view_on_github')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoreBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _StoreBadge({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: theme.colorScheme.primary),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
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

class _CVSection extends StatelessWidget {
  const _CVSection();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return AnimatedSection(
      index: 5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
              theme.colorScheme.surface,
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            _SectionHeader(title: t.tr('download_cv')),
            const SizedBox(height: 16),
            Text(
              t.tr('cv_subtitle'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: () => launchUrl(Uri.parse(
                'https://raw.githubusercontent.com/mahmoudfahmy616572/My_protfolio/gh-pages/assets/assets/pdfs/my_cv.pdf',
              )),
              icon: const Icon(Icons.download),
              label: Text(t.tr('download_cv_btn')),
              style: FilledButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              t.tr('cv_note'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
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
      index: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            _SectionHeader(title: t.tr('contact')),
            const SizedBox(height: 20),
            Text(
              t.tr('contact_subtitle'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 20,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: [
                _ContactItem(
                  icon: Icons.email_outlined,
                  label: 'Email',
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

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(title, style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w600,
        )),
        const SizedBox(height: 10),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: theme.colorScheme.primary,
          ),
        ),
      ],
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: theme.colorScheme.primary, size: 22),
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
