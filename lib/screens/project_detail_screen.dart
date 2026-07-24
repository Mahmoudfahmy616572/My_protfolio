import 'dart:math' as math;
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

class ProjectDetailScreen extends StatefulWidget {
  final ProjectData project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen>
    with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final AnimationController _shimmerController;
  late final AnimationController _pulseController;
  late final AnimationController _colorController;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideController.forward();
    _colorController.forward();
    _pulseController.repeat(reverse: true);
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _shimmerController.repeat();
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _shimmerController.dispose();
    _pulseController.dispose();
    _colorController.dispose();
    super.dispose();
  }

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
                    widget.project.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (widget.project.seniority.isNotEmpty)
                  _AnimatedSeniorityBadge(
                    label: widget.project.seniority,
                    slideAnimation: _slideController,
                    shimmerAnimation: _shimmerController,
                    pulseAnimation: _pulseController,
                    colorAnimation: _colorController,
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
                          widget.project.imagePath,
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
                        widget.project.name,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.project.description,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          height: 1.7,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.85),
                        ),
                      ),
                      if (widget.project.techStack.isNotEmpty) ...[
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
                          children: widget.project.techStack.map((tech) {
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

    if (widget.project.liveDemoUrl != null) {
      buttons.add(SizedBox(
        width: double.infinity,
        child: _DetailButton(
          label: widget.project.driverLiveDemoUrl != null
              ? t.tr('user_demo')
              : t.tr('live_demo'),
          icon: Icons.phone_iphone,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DemoScreen(
                url: widget.project.liveDemoUrl!,
                title: widget.project.name,
              ),
            ),
          ),
        ),
      ));
    }

    if (widget.project.driverLiveDemoUrl != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      buttons.add(SizedBox(
        width: double.infinity,
        child: _DetailButton(
          label: t.tr('driver_demo'),
          icon: Icons.local_shipping_outlined,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DemoScreen(
                url: widget.project.driverLiveDemoUrl!,
                title: '${widget.project.name} Driver',
              ),
            ),
          ),
        ),
      ));
    }

    final hasLinks = widget.project.dashboardUrl != null ||
        widget.project.adminDashboardUrl != null ||
        widget.project.apkUrl != null ||
        widget.project.driverApkUrl != null;

    if (hasLinks) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      buttons.add(Row(
        children: [
          if (widget.project.dashboardUrl != null)
            Expanded(
              child: _DetailButton(
                label: widget.project.dashboardLabel ?? 'Web App',
                icon: Icons.language,
                onTap: () =>
                    launchUrl(Uri.parse(widget.project.dashboardUrl!)),
              ),
            ),
          if (widget.project.dashboardUrl != null &&
              (widget.project.adminDashboardUrl != null ||
                  widget.project.apkUrl != null))
            const SizedBox(width: 10),
          if (widget.project.adminDashboardUrl != null)
            Expanded(
              child: _DetailButton(
                label: widget.project.adminDashboardLabel ?? 'Admin',
                icon: Icons.admin_panel_settings,
                onTap: () => launchUrl(
                    Uri.parse(widget.project.adminDashboardUrl!)),
              ),
            ),
          if (widget.project.adminDashboardUrl != null &&
              widget.project.apkUrl != null)
            const SizedBox(width: 10),
          if (widget.project.apkUrl != null)
            Expanded(
              child: _DetailButton(
                label: 'User APK',
                icon: Icons.download,
                onTap: () =>
                    launchUrl(Uri.parse(widget.project.apkUrl!)),
              ),
            ),
        ],
      ));
    }

    if (widget.project.driverApkUrl != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      buttons.add(SizedBox(
        width: double.infinity,
        child: _DetailButton(
          label: 'Driver APK',
          icon: Icons.download,
          onTap: () =>
              launchUrl(Uri.parse(widget.project.driverApkUrl!)),
        ),
      ));
    }

    if (widget.project.githubUrl != null) {
      if (buttons.isNotEmpty) buttons.add(const SizedBox(height: 10));
      final readmeUrl = '${widget.project.githubUrl}/blob/main/README.md';
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

class _AnimatedSeniorityBadge extends StatelessWidget {
  final String label;
  final Animation<double> slideAnimation;
  final Animation<double> shimmerAnimation;
  final Animation<double> pulseAnimation;
  final Animation<double> colorAnimation;

  const _AnimatedSeniorityBadge({
    required this.label,
    required this.slideAnimation,
    required this.shimmerAnimation,
    required this.pulseAnimation,
    required this.colorAnimation,
  });

  Color get _badgeColor {
    final lower = label.toLowerCase();
    if (lower.contains('senior')) return const Color(0xFF7C4DFF);
    if (lower.contains('intermediate')) return const Color(0xFFFF8A65);
    if (lower.contains('junior')) return const Color(0xFF66BB6A);
    return const Color(0xFF78909C);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _badgeColor;

    return AnimatedBuilder(
      animation: Listenable.merge([
        slideAnimation,
        shimmerAnimation,
        pulseAnimation,
        colorAnimation,
      ]),
      builder: (context, child) {
        final slideOffset = 1.0 - Curves.easeOutBack.transform(
          slideAnimation.value.clamp(0.0, 1.0),
        );
        final colorAlpha = colorAnimation.value.clamp(0.0, 1.0);
        final glowAlpha = 0.15 + pulseAnimation.value * 0.25;
        final glowBlur = 6.0 + pulseAnimation.value * 8.0;

        return Transform.translate(
          offset: Offset(60 * slideOffset, 0),
          child: Opacity(
            opacity: 1.0 - slideOffset,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.9 * colorAlpha),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: glowAlpha),
                    blurRadius: glowBlur,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ShaderMask(
                shaderCallback: (rect) {
                  final shimmerPos =
                      (shimmerAnimation.value * 2.0 - 0.5);
                  return LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withValues(alpha: 0.7),
                      Colors.white,
                    ],
                    stops: [
                      (shimmerPos - 0.3).clamp(0.0, 1.0),
                      shimmerPos.clamp(0.0, 1.0),
                      (shimmerPos + 0.3).clamp(0.0, 1.0),
                    ],
                    begin: const Alignment(-1, -0.3),
                    end: const Alignment(1, 0.3),
                  ).createShader(rect);
                },
                blendMode: BlendMode.srcATop,
                child: Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
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
