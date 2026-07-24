import 'dart:convert';
import 'dart:math' show sin, pi;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/screens/demo_screen.dart';
import 'package:portfolio/screens/project_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../cv_downloader.dart';
import '../localization.dart';
import '../providers.dart';
import '../widgets/animated_section.dart';
import '../widgets/particle_bg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0;
  bool _showBackToTop = false;
  int _activeSection = 0;

  static const _sectionKeys = ['about_me', 'skills', 'projects', 'download_cv', 'contact'];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final pos = _scrollController.position;
    final progress = pos.maxScrollExtent > 0 ? pos.pixels / pos.maxScrollExtent : 0.0;
    final sectionCount = _sectionKeys.length + 2;
    final section = (progress * sectionCount).floor().clamp(0, sectionCount - 1);
    setState(() {
      _scrollProgress = progress.clamp(0.0, 1.0);
      _showBackToTop = pos.pixels > 400;
      _activeSection = section;
    });
  }

  void _scrollToSection(int index) {
    final sectionCount = _sectionKeys.length + 2;
    final target = _scrollController.position.maxScrollExtent * (index / (sectionCount - 1));
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  Widget _buildSectionDot(BuildContext context, int index, String label) {
    final theme = Theme.of(context);
    final isActive = index == _activeSection;
    return Tooltip(
      message: label,
      child: GestureDetector(
        onTap: () => _scrollToSection(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(vertical: 6),
          width: isActive ? 10 : 6,
          height: isActive ? 10 : 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface.withValues(alpha: 0.25),
            boxShadow: isActive
                ? [BoxShadow(color: theme.colorScheme.primary.withValues(alpha: 0.4), blurRadius: 6)]
                : null,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      body: Stack(
        children: [
          ParticleBg(
            primaryColor: theme.colorScheme.primary,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _HeaderSection(),
                  const _StatsBar(),
                  const _AboutSection(),
                  const _SkillsSection(),
                  const _ProjectsSection(),
                  const _CVSection(),
                  _ContactSection(),
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
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 3,
            child: Container(
              width: MediaQuery.of(context).size.width * _scrollProgress,
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.tertiary,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: isRtl ? null : 8,
            left: isRtl ? 8 : null,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              ignoring: !_showBackToTop,
              child: AnimatedOpacity(
                opacity: _showBackToTop ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSectionDot(context, 0, t.tr('name')),
                    _buildSectionDot(context, 1, 'Stats'),
                    ..._sectionKeys.asMap().entries.map((e) =>
                      _buildSectionDot(context, e.key + 2, t.tr(e.value)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSlide(
            offset: _showBackToTop ? Offset.zero : const Offset(0, 3),
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: _showBackToTop ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: _FAB(
                icon: Icons.keyboard_arrow_up,
                tooltip: 'Back to top',
                onPressed: () => _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic,
                ),
              ),
            ),
          ),
          if (_showBackToTop) const SizedBox(height: 8),
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

class _FAB extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _FAB({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  State<_FAB> createState() => _FABState();
}

class _FABState extends State<_FAB> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.4),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: AnimatedScale(
          scale: _hovered ? 1.12 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: FloatingActionButton.small(
            heroTag: widget.tooltip,
            onPressed: widget.onPressed,
            tooltip: widget.tooltip,
            child: AnimatedRotation(
              turns: _hovered ? 0.125 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              child: Icon(widget.icon),
            ),
          ),
        ),
      ),
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
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
            _FloatingWidget(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _PulseRing(color: theme.colorScheme.primary, delay: 0),
                  _PulseRing(color: theme.colorScheme.tertiary, delay: 1),
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
                          ResizeImage(
                          const AssetImage('assets/images/profile.jpeg'),
                          width: 272),
                      backgroundColor: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            _GradientText(
              text: t.tr('name'),
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
              child: _TypewriterText(
                key: ValueKey(t.tr('title')),
                text: t.tr('title'),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            _FloatingWidget(
              amplitude: 3,
              duration: 2,
              child: Row(
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
            ),
            const SizedBox(height: 16),
            _OpenToWorkBadge(),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialButton(
                  icon: const Icon(Icons.email_outlined),
                  label: 'Email',
                  url: 'mailto:mahmoudfahmeyy@gmail.com',
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  icon: const Icon(Icons.code),
                  label: 'GitHub',
                  url: 'https://github.com/Mahmoudfahmy616572',
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  icon: const Icon(Icons.link),
                  label: 'LinkedIn',
                  url: 'https://linkedin.com/in/mahmoud__fahmy',
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  icon: FaIcon(FontAwesomeIcons.whatsapp),
                  label: t.tr('whatsapp'),
                  url: 'https://wa.me/201013312546',
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
  final Widget icon;
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
  double _magnetX = 0;
  double _magnetY = 0;

  void _onHover(PointerEvent event) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;
    final local = box.globalToLocal(event.position);
    final size = box.size;
    final cx = size.width / 2;
    final cy = size.height / 2;
    setState(() {
      _magnetX = ((local.dx - cx) / cx) * 6;
      _magnetY = ((local.dy - cy) / cy) * 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onHover: _onHover,
      onExit: (_) => setState(() {
        _hovered = false;
        _magnetX = 0;
        _magnetY = 0;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Transform.translate(
          offset: Offset(_magnetX, _magnetY),
          child: AnimatedScale(
            scale: _hovered ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutBack,
              child: Tooltip(
              message: widget.label,
              child: IconButton.filled(
                onPressed: () => launchUrl(Uri.parse(widget.url)),
                icon: widget.icon,
              ),
            ),
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
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
              index: 0,
            ),
            _StatItem(
              icon: Icons.store,
              value: '5K+',
              label: 'Google Play Downloads',
              index: 1,
            ),
            _StatItem(
              icon: Icons.code,
              value: '14',
              label: 'GitHub Repos',
              index: 2,
            ),
            _StatItem(
              icon: Icons.work_outline,
              value: '2+',
              label: 'Years Experience',
              index: 3,
            ),
            _GitHubLiveStat(index: 4),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatefulWidget {
  final IconData icon;
  final String value;
  final String label;
  final int index;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    this.index = 0,
  });

  @override
  State<_StatItem> createState() => _StatItemState();
}

class _StatItemState extends State<_StatItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final double _target;
  late final String _suffix;
  ScrollPosition? _scrollPosition;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    final match = RegExp(r'^(\d+(?:\.\d+)?)(.*)$').firstMatch(widget.value);
    _target = double.parse(match?.group(1) ?? '0');
    _suffix = match?.group(2) ?? '';

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scrollable = Scrollable.maybeOf(context);
    final newPosition = scrollable?.position;
    if (newPosition != _scrollPosition) {
      _scrollPosition?.removeListener(_onScroll);
      _scrollPosition = newPosition;
      newPosition?.addListener(_onScroll);
    }
  }

  void _onScroll() {
    _checkVisibility();
  }

  void _checkVisibility() {
    if (!mounted) return;
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final pos = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final scrollable = Scrollable.maybeOf(context);
    final viewportHeight = scrollable?.context.size?.height ?? 600;
    final isVisible = pos.dy < viewportHeight && pos.dy + size.height > 0;

    if (isVisible && !_visible) {
      _visible = true;
      Future.delayed(Duration(milliseconds: 300 + 200 * widget.index), () {
        if (mounted && _visible) _controller.forward(from: 0);
      });
    } else if (!isVisible && _visible) {
      _visible = false;
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(widget.icon, color: theme.colorScheme.primary, size: 24),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            final current = (_target * _animation.value);
            final display = _suffix.isEmpty
                ? current.toInt().toString()
                : '${current.toInt()}$_suffix';
            return Text(
              display,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            );
          },
        ),
        Text(
          widget.label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

class _GitHubLiveStat extends StatefulWidget {
  final int index;

  const _GitHubLiveStat({this.index = 0});

  @override
  State<_GitHubLiveStat> createState() => _GitHubLiveStatState();
}

class _GitHubLiveStatState extends State<_GitHubLiveStat>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  int _repos = 0;
  bool _loaded = false;
  ScrollPosition? _scrollPosition;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchStats();
      _checkVisibility();
    });
  }

  Future<void> _fetchStats() async {
    try {
      final res = await http.get(
        Uri.parse('https://api.github.com/users/Mahmoudfahmy616572'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );
      if (res.statusCode == 200 && mounted) {
        final data = jsonDecode(res.body);
        setState(() {
          _repos = data['public_repos'] ?? 0;
          _loaded = true;
        });
      }
    } catch (_) {}
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scrollable = Scrollable.maybeOf(context);
    final newPosition = scrollable?.position;
    if (newPosition != _scrollPosition) {
      _scrollPosition?.removeListener(_onScroll);
      _scrollPosition = newPosition;
      newPosition?.addListener(_onScroll);
    }
  }

  void _onScroll() {
    _checkVisibility();
  }

  void _checkVisibility() {
    if (!mounted) return;
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final pos = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final scrollable = Scrollable.maybeOf(context);
    final viewportHeight = scrollable?.context.size?.height ?? 600;
    final isVisible = pos.dy < viewportHeight && pos.dy + size.height > 0;
    if (isVisible && !_visible) {
      _visible = true;
      Future.delayed(Duration(milliseconds: 300 + 200 * widget.index), () {
        if (mounted && _visible) _controller.forward(from: 0);
      });
    } else if (!isVisible && _visible) {
      _visible = false;
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (!_loaded) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.code, color: theme.colorScheme.primary, size: 24),
          const SizedBox(height: 8),
          Icon(Icons.circle, size: 24, color: theme.colorScheme.primary.withValues(alpha: 0.2)),
          const SizedBox(height: 4),
          Text('GitHub',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.code, color: theme.colorScheme.primary, size: 24),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Text(
              (_repos * _animation.value).toInt().toString(),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            );
          },
        ),
        Text('GitHub Repos',
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
      (t.tr('skill_flutter'), Icons.phone_android, 0.92),
      (t.tr('skill_dart'), Icons.code, 0.88),
      (t.tr('skill_supabase'), Icons.bolt, 0.91),
      (t.tr('skill_firebase'), Icons.storage, 0.80),
      (t.tr('skill_git'), Icons.source, 0.85),
    ];

    final categories = [
      (
        t.tr('cat_architecture'),
        Icons.architecture,
        [
          t.tr('skill_flutter'),
          t.tr('skill_dart'),
          t.tr('skill_oop'),
          t.tr('skill_mvvm'),
          t.tr('skill_bloc'),
          t.tr('skill_provider'),
        ],
      ),
      (
        t.tr('cat_backend'),
        Icons.dns,
        [
          t.tr('skill_firebase'),
          t.tr('skill_supabase'),
          'Cloud Functions',
          'Firestore',
          'Realtime DB',
          'Local Storage',
        ],
      ),
      (
        t.tr('cat_apis'),
        Icons.payment,
        [
          t.tr('skill_rest_api'),
          t.tr('skill_stripe'),
          'Stripe Connect',
          t.tr('skill_paymob'),
        ],
      ),
      (
        t.tr('cat_networking'),
        Icons.wifi,
        [
          'TCP/IP',
          'OSI Model',
          'Routing & Switching',
          'Network Security',
        ],
      ),
      (
        t.tr('cat_tools'),
        Icons.build,
        [
          t.tr('skill_git'),
          'GitHub',
          'GitLab',
          'Postman',
          t.tr('skill_google_maps'),
          'Android Studio',
          t.tr('skill_ui_ux'),
        ],
      ),
    ];

    return AnimatedSection(
      index: 3,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: double.infinity,
        color: theme.colorScheme.surfaceContainerHighest,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            _SectionHeader(title: t.tr('skills')),
            const SizedBox(height: 28),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  ...skills.asMap().entries.map((entry) {
                    return _AnimatedChip(
                      index: entry.key,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: _SkillBar(
                          value: entry.value.$3,
                          index: entry.key,
                          label: entry.value.$1,
                          icon: entry.value.$2,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 32),
                  ...categories.asMap().entries.map((catEntry) {
                    final cat = catEntry.value;
                    return _AnimatedChip(
                      index: skills.length + catEntry.key,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(cat.$2,
                                    size: 16,
                                    color: theme.colorScheme.primary),
                                const SizedBox(width: 8),
                                Text(
                                  cat.$1,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: cat.$3.map((skill) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: theme.colorScheme.surface,
                                    border: Border.all(
                                      color: theme.colorScheme.outlineVariant,
                                    ),
                                  ),
                                  child: Text(
                                    skill,
                                    style: theme.textTheme.labelMedium?.copyWith(
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.8),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
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
    final filterLevel = context.watch<FilterProvider>().level;

    final allProjects = [
      _Project(
        name: t.tr('project_unipath'),
        description: t.tr('project_unipath_desc'),
        shortDescription: t.tr('project_unipath_desc_short'),
        imagePath: 'assets/images/UniPath.png',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/uni_path_germany',
        adminDashboardUrl: 'https://mahmoudfahmy616572.github.io/uni-path-germany-dashboard/',
        adminDashboardLabel: 'Admin Panel',
        apkUrl:
            'https://github.com/Mahmoudfahmy616572/uni-path-germany-dashboard/releases/download/v1.0.2/app-arm64-v8a-release.apk',
        seniority: SeniorityLevel.senior,
        techStack: const ['Flutter', 'Dart', 'Firebase', 'Supabase', 'REST API'],
        liveDemoUrl: 'https://mahmoudfahmy616572.github.io/uni-path-germany-web/',
      ),
      _Project(
        name: t.tr('project_ship_link'),
        description: t.tr('project_ship_link_desc'),
        shortDescription: t.tr('project_ship_link_desc_short'),
        imagePath: 'assets/images/ShipLink.png',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/ship_link',
        dashboardUrl: 'https://mahmoudfahmy616572.github.io/ship_link/',
        adminDashboardUrl: 'https://mahmoudfahmy616572.github.io/ship_link/admin/',
        adminDashboardLabel: 'Admin Panel',
        apkUrl:
            'https://github.com/Mahmoudfahmy616572/ship_link/releases/download/v1.0.0/app-arm64-v8a-user-release.apk',
        driverApkUrl:
            'https://github.com/Mahmoudfahmy616572/ship_link/releases/download/v1.0.0/app-arm64-v8a-driver-release.apk',
        seniority: SeniorityLevel.senior,
        techStack: const ['Flutter', 'Dart', 'Supabase', 'Firebase', 'Paymob'],
        liveDemoUrl: 'https://mahmoudfahmy616572.github.io/ship_link/',
        driverLiveDemoUrl: 'https://mahmoudfahmy616572.github.io/ship_link/driver/',
      ),
      _Project(
        name: t.tr('project_sneakers'),
        description: t.tr('project_sneakers_desc'),
        shortDescription: t.tr('project_sneakers_desc_short'),
        imagePath: 'assets/images/Sneakers.png',
        githubUrl:
            'https://github.com/Mahmoudfahmy616572/Sneakers_eCommerce',
        seniority: SeniorityLevel.junior,
        techStack: const ['Flutter', 'Dart', 'REST API'],
      ),
      _Project(
        name: t.tr('project_soundora'),
        description: t.tr('project_soundora_desc'),
        shortDescription: t.tr('project_soundora_desc_short'),
        imagePath: 'assets/images/SoundOra.png',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/soundora',
        seniority: SeniorityLevel.senior,
        techStack: const ['Flutter', 'Dart', 'Firebase', 'Cloudinary'],
      ),
      _Project(
        name: t.tr('project_minishop'),
        description: t.tr('project_minishop_desc'),
        shortDescription: t.tr('project_minishop_desc_short'),
        imagePath: 'assets/images/minishop.jpeg',
        githubUrl: 'https://github.com/Mahmoudfahmy616572/e_commerce',
        seniority: SeniorityLevel.junior,
        techStack: const ['Flutter', 'Dart', 'REST API'],
      ),
    ];

    final projects = filterLevel == SeniorityLevel.all
        ? allProjects
        : allProjects.where((p) => p.seniority == filterLevel).toList();

    return AnimatedSection(
      index: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Column(
          children: [
            _SectionHeader(title: t.tr('projects')),
            const SizedBox(height: 28),
            _FilterChips(currentLevel: filterLevel),
            const SizedBox(height: 32),
            if (projects.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  filterLevel == SeniorityLevel.senior
                      ? 'No senior projects yet'
                      : filterLevel == SeniorityLevel.intermediate
                          ? 'No intermediate projects yet'
                          : 'No junior projects yet',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color:
                        theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              )
            else
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: Wrap(
                  key: ValueKey(filterLevel),
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
              ),
          ],
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  final SeniorityLevel currentLevel;

  const _FilterChips({required this.currentLevel});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final chips = [
      (SeniorityLevel.all, t.tr('filter_all')),
      (SeniorityLevel.junior, t.tr('filter_junior')),
      (SeniorityLevel.intermediate, t.tr('filter_intermediate')),
      (SeniorityLevel.senior, t.tr('filter_senior')),
    ];

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: chips.map((c) {
            final isSelected = c.$1 == currentLevel;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text(c.$2),
                selected: isSelected,
                onSelected: (_) =>
                    context.read<FilterProvider>().setLevel(c.$1),
                selectedColor: _chipColor(c.$1, theme),
                backgroundColor: theme.colorScheme.surfaceContainerHighest
                    .withValues(alpha: 0.5),
                labelStyle: TextStyle(
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurface,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color _chipColor(SeniorityLevel level, ThemeData theme) {
    switch (level) {
      case SeniorityLevel.senior:
        return const Color(0xFF7C4DFF);
      case SeniorityLevel.intermediate:
        return const Color(0xFFFF8A65);
      case SeniorityLevel.junior:
        return const Color(0xFF66BB6A);
      case SeniorityLevel.all:
        return theme.colorScheme.primary;
    }
  }
}

class _Project {
  final String name;
  final String description;
  final String shortDescription;
  final String imagePath;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final String? dashboardUrl;
  final String? dashboardLabel;
  final String? adminDashboardUrl;
  final String? adminDashboardLabel;
  final String? apkUrl;
  final String? driverApkUrl;
  final String? liveDemoUrl;
  final String? driverLiveDemoUrl;
  final SeniorityLevel seniority;
  final List<String> techStack;

  const _Project({
    required this.name,
    required this.description,
    this.shortDescription = '',
    required this.imagePath,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.dashboardUrl,
    this.dashboardLabel,
    this.adminDashboardUrl,
    this.adminDashboardLabel,
    this.apkUrl,
    this.driverApkUrl,
    this.liveDemoUrl,
    this.driverLiveDemoUrl,
    this.seniority = SeniorityLevel.all,
    this.techStack = const [],
  });
}

({IconData icon, Color color})? _techIcon(String tech) {
  switch (tech) {
    case 'Firebase':
      return (icon: Icons.local_fire_department, color: Colors.orange);
    case 'Supabase':
      return (icon: Icons.bolt, color: Colors.green);
    default:
      return null;
  }
}

class _ProjectCard extends StatefulWidget {
  final _Project project;
  final int index;

  const _ProjectCard({required this.project, required this.index});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;
  double _tiltX = 0;
  double _tiltY = 0;
  final GlobalKey _cardKey = GlobalKey();

  void _onMouseMove(PointerEvent event) {
    final box = _cardKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    final localPos = box.globalToLocal(event.position);
    final size = box.size;
    final cx = size.width / 2;
    final cy = size.height / 2;
    setState(() {
      _tiltX = ((localPos.dy - cy) / cy).clamp(-1.0, 1.0);
      _tiltY = ((localPos.dx - cx) / cx).clamp(-1.0, 1.0);
    });
  }

  void _showImageDialog(BuildContext ctx) {
    showGeneralDialog(
      context: ctx,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black87,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (ctx, anim1, anim2) => Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          title: Text(
            widget.project.name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: InteractiveViewer(
          child: Center(
            child: Image.asset(
              widget.project.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image, color: Colors.white, size: 64),
            ),
          ),
        ),
      ),
      transitionBuilder: (ctx, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: anim1, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: anim1, child: child),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return MouseRegion(
      onHover: _onMouseMove,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _tiltX = 0;
        _tiltY = 0;
      }),
      child: AnimatedStaggeredCard(
        index: widget.index,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          child: Transform(
            key: _cardKey,
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-_tiltX * 0.04)
              ..rotateY(_tiltY * 0.04),
            child: Card(
              elevation: _hovered ? 8 : 1,
            shadowColor: theme.colorScheme.primary.withValues(alpha: 0.3),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                  onTap: () => _showImageDialog(context),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Stack(
                          children: [
                            _ShimmerBox(height: 200),
                            Image.asset(
                              widget.project.imagePath,
                              cacheWidth: 680,
                              fit: BoxFit.fitWidth,
                              errorBuilder: (_, __, ___) => const Center(
                                  child: Icon(Icons.image, size: 48)),
                              frameBuilder: (ctx, child, frame, wasSync) {
                                if (wasSync || frame != null) return child;
                                return const SizedBox.shrink();
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: _ImageExpandIcon(),
                      ),
                      if (widget.project.playStoreUrl != null)
                        Positioned(
                          top: 8,
                          left: 8,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.project.shortDescription.isNotEmpty
                            ? widget.project.shortDescription
                            : widget.project.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.7),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: _StoreBadge(
                          label: t.tr('go_to_project'),
                          icon: Icons.arrow_forward_ios,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProjectDetailScreen(
                                project: ProjectData(
                                  name: widget.project.name,
                                  description: widget.project.description,
                                  imagePath: widget.project.imagePath,
                                  githubUrl: widget.project.githubUrl,
                                  dashboardUrl: widget.project.dashboardUrl,
                                  dashboardLabel: widget.project.dashboardLabel,
                                  adminDashboardUrl: widget.project.adminDashboardUrl,
                                  adminDashboardLabel: widget.project.adminDashboardLabel,
                                  apkUrl: widget.project.apkUrl,
                                  driverApkUrl: widget.project.driverApkUrl,
                                  liveDemoUrl: widget.project.liveDemoUrl,
                                  driverLiveDemoUrl: widget.project.driverLiveDemoUrl,
                                  seniority: widget.project.seniority != SeniorityLevel.all
                                      ? widget.project.seniority.name[0].toUpperCase() + widget.project.seniority.name.substring(1)
                                      : '',
                                  techStack: widget.project.techStack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageExpandIcon extends StatelessWidget {
  const _ImageExpandIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        Icons.fullscreen,
        size: 18,
        color: Colors.white.withValues(alpha: 0.9),
      ),
    );
  }
}

class _FloatingWidget extends StatefulWidget {
  final Widget child;
  final double amplitude;
  final double duration;

  const _FloatingWidget({
    required this.child,
    this.amplitude = 8,
    this.duration = 3,
  });

  @override
  State<_FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<_FloatingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration.toInt()),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, sin(_controller.value * pi) * widget.amplitude),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _OpenToWorkBadge extends StatefulWidget {
  const _OpenToWorkBadge();

  @override
  State<_OpenToWorkBadge> createState() => _OpenToWorkBadgeState();
}

class _OpenToWorkBadgeState extends State<_OpenToWorkBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _opacity = Tween<double>(begin: 1.0, end: 0.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark
            ? Colors.green.withValues(alpha: 0.15)
            : Colors.green.withValues(alpha: 0.12),
        border: Border.all(
          color: Colors.green.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => Opacity(
              opacity: _opacity.value,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            t.tr('open_to_work'),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.green.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const _GradientText({required this.text, this.style});

  @override
  State<_GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<_GradientText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.tertiary,
                theme.colorScheme.primary,
              ],
              stops: [
                (_controller.value - 0.3).clamp(0.0, 1.0),
                _controller.value.clamp(0.0, 1.0),
                (_controller.value + 0.3).clamp(0.0, 1.0),
              ],
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: widget.style?.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}

class _TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const _TypewriterText({super.key, required this.text, this.style});

  @override
  State<_TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<_TypewriterText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _charCount;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50 * widget.text.length),
    );
    _charCount = IntTween(begin: 0, end: widget.text.length).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _charCount,
      builder: (context, _) {
        final visible = widget.text.substring(0, _charCount.value);
        return Text(
          visible + (_charCount.value < widget.text.length ? '▎' : ''),
          style: widget.style,
        );
      },
    );
  }
}

class _PulseRing extends StatefulWidget {
  final Color color;
  final int delay;

  const _PulseRing({required this.color, this.delay = 0});

  @override
  State<_PulseRing> createState() => _PulseRingState();
}

class _PulseRingState extends State<_PulseRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    Future.delayed(Duration(seconds: widget.delay), () {
      if (mounted) _controller.repeat(reverse: true);
    });
    _scale = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    _opacity = Tween<double>(begin: 0.5, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.scale(
          scale: _scale.value,
          child: Container(
            width: 146,
            height: 146,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.color.withValues(alpha: _opacity.value),
                width: 2.5,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AnimatedChip extends StatefulWidget {
  final Widget child;
  final int index;
  final int baseDelay;

  const _AnimatedChip({
    required this.child,
    this.index = 0,
    this.baseDelay = 350,
  });

  @override
  State<_AnimatedChip> createState() => _AnimatedChipState();
}

class _AnimatedChipState extends State<_AnimatedChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _anim = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    Future.delayed(
        Duration(milliseconds: widget.baseDelay + 100 * widget.index), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Opacity(
          opacity: _anim.value.clamp(0.0, 1.0),
          child: Transform.scale(scale: _anim.value, child: child),
        );
      },
      child: widget.child,
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

class _SeniorityBadge extends StatelessWidget {
  final SeniorityLevel level;

  const _SeniorityBadge({required this.level});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final label = switch (level) {
      SeniorityLevel.junior => t.tr('filter_junior'),
      SeniorityLevel.intermediate => t.tr('filter_intermediate'),
      SeniorityLevel.senior => t.tr('filter_senior'),
      _ => '',
    };
    final color = switch (level) {
      SeniorityLevel.senior => const Color(0xFF7C4DFF),
      SeniorityLevel.intermediate => const Color(0xFFFF8A65),
      SeniorityLevel.junior => const Color(0xFF66BB6A),
      _ => Colors.transparent,
    };

    if (level == SeniorityLevel.all) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _SkillBar extends StatefulWidget {
  final double value;
  final int index;
  final String label;
  final IconData icon;

  const _SkillBar({
    required this.value,
    required this.index,
    required this.label,
    required this.icon,
  });

  @override
  State<_SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<_SkillBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _anim;
  ScrollPosition? _scrollPosition;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _anim = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scrollable = Scrollable.maybeOf(context);
    final newPosition = scrollable?.position;
    if (newPosition != _scrollPosition) {
      _scrollPosition?.removeListener(_onScroll);
      _scrollPosition = newPosition;
      newPosition?.addListener(_onScroll);
    }
  }

  void _onScroll() {
    _checkVisibility();
  }

  void _checkVisibility() {
    if (!mounted) return;
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final pos = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final scrollable = Scrollable.maybeOf(context);
    final viewportHeight = scrollable?.context.size?.height ?? 600;
    final isVisible = pos.dy < viewportHeight && pos.dy + size.height > 0;

    if (isVisible && !_visible) {
      _visible = true;
      Future.delayed(Duration(milliseconds: 300 + 100 * widget.index), () {
        if (mounted && _visible) _controller.forward(from: 0);
      });
    } else if (!isVisible && _visible) {
      _visible = false;
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, _) {
        final currentPercent = (widget.value * _anim.value * 100).toInt();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.icon,
                    size: 18, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '$currentPercent%',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 8,
                color: theme.colorScheme.surfaceContainerHighest,
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: widget.value * _anim.value,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.tertiary,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
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
              onPressed: downloadCv,
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

class _ContactSection extends StatefulWidget {
  @override
  State<_ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<_ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sending = true);
    final subject = Uri.encodeComponent(
        'Portfolio Contact from ${_nameController.text}');
    final body = Uri.encodeComponent(
      'Name: ${_nameController.text}\n'
      'Email: ${_emailController.text}\n\n'
      '${_messageController.text}',
    );
    launchUrl(Uri.parse('mailto:mahmoudfahmeyy@gmail.com?subject=$subject&body=$body'));
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() => _sending = false);
      _formKey.currentState?.reset();
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    });
  }

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
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: t.tr('form_name'),
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: t.tr('form_email'),
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Required';
                        if (!v.contains('@')) return 'Invalid email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: t.tr('form_message'),
                        alignLabelWithHint: true,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 64),
                          child: Icon(Icons.message_outlined),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: _sending ? null : _sendMessage,
                      icon: _sending
                          ? const SizedBox(
                              width: 18, height: 18,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white))
                          : const Icon(Icons.send),
                      label: Text(_sending ? t.tr('form_sent') : t.tr('form_send')),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 20,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: [
                AnimatedStaggeredCard(
                  index: 0,
                  child: _ContactItem(
                    icon: Icon(Icons.email_outlined,
                        color: theme.colorScheme.primary, size: 22),
                    label: 'Email',
                    value: 'mahmoudfahmeyy@gmail.com',
                    url: 'mailto:mahmoudfahmeyy@gmail.com',
                  ),
                ),
                AnimatedStaggeredCard(
                  index: 1,
                  child: _ContactItem(
                    icon: Icon(Icons.code,
                        color: theme.colorScheme.primary, size: 22),
                    label: 'GitHub',
                    value: '@Mahmoudfahmy616572',
                    url: 'https://github.com/Mahmoudfahmy616572',
                  ),
                ),
                AnimatedStaggeredCard(
                  index: 2,
                  child: _ContactItem(
                    icon: Icon(Icons.link,
                        color: theme.colorScheme.primary, size: 22),
                    label: 'LinkedIn',
                    value: 'Mahmoud Fahmy',
                    url: 'https://linkedin.com/in/mahmoud__fahmy',
                  ),
                ),
                AnimatedStaggeredCard(
                  index: 3,
                  child: _ContactItem(
                    icon: FaIcon(FontAwesomeIcons.whatsapp,
                        color: const Color(0xFF25D366), size: 22),
                    label: t.tr('whatsapp'),
                    value: '+201013312546',
                    url: 'https://wa.me/201013312546',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ShimmerBox extends StatefulWidget {
  final double height;
  final BorderRadius? borderRadius;

  const _ShimmerBox({this.height = 200, this.borderRadius});

  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            gradient: LinearGradient(
              begin: Alignment(-1 + _controller.value * 2, 0),
              end: Alignment(1 + _controller.value * 2, 0),
              colors: [
                theme.colorScheme.surfaceContainerHighest,
                theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                theme.colorScheme.surfaceContainerHighest,
              ],
            ),
          ),
        );
      },
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
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
          builder: (context, value, _) {
            return Container(
              width: 50 * value,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: theme.colorScheme.primary,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Widget icon;
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
            icon,
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
