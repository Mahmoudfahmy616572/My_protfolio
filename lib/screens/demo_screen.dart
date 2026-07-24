import 'dart:html' as html;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';
import 'package:portfolio/localization.dart';

class DemoScreen extends StatefulWidget {
  final String url;
  final String title;

  const DemoScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'iframe-demo-${widget.title}';
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int id) {
      final iframe = html.IFrameElement()
        ..src = widget.url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.margin = '0'
        ..style.padding = '0'
        ..allow =
            'accelerometer; camera; geolocation; microphone; clipboard-write'
        ..setAttribute('loading', 'eager');
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final screenW = MediaQuery.of(context).size.width;
    final isWide = screenW > 800;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          _buildHeader(context, t, theme),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availW = constraints.maxWidth;
                final availH = constraints.maxHeight;

                double frameW;
                double frameH;

                if (isWide) {
                  frameH = availH - 24;
                  frameW = frameH * 9 / 19.5;
                  if (frameW > 400) {
                    frameW = 400;
                    frameH = frameW * 19.5 / 9;
                  }
                } else {
                  frameW = availW * 0.92;
                  frameH = frameW * 19.5 / 9;
                  if (frameH > availH - 16) {
                    frameH = availH - 16;
                    frameW = frameH * 9 / 19.5;
                  }
                }

                final borderWidth = 4.0;
                final notchH = 44.0;
                final homeBarH = 12.0;
                final iframeW = frameW - borderWidth * 2;
                final iframeH = frameH - borderWidth * 2 - notchH - homeBarH;

                return Center(
                  child: SizedBox(
                    width: frameW,
                    height: frameH,
                    child: _PhoneFrame(
                      theme: theme,
                      notchHeight: notchH,
                      homeBarHeight: homeBarH,
                      viewType: _viewType,
                      iframeWidth: iframeW,
                      iframeHeight: iframeH,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, AppLocalizations t, ThemeData theme) {
    final screenW = MediaQuery.of(context).size.width;
    final isWide = screenW > 800;

    return Container(
      padding: EdgeInsets.fromLTRB(
          isWide ? 32 : 16,
          MediaQuery.of(context).padding.top + 12,
          isWide ? 32 : 16,
          12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
          ),
          const SizedBox(width: 12),
          Icon(Icons.phone_iphone,
              color: theme.colorScheme.primary, size: 22),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withValues(alpha: 0.6),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  t.tr('live_demo'),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  final ThemeData theme;
  final double notchHeight;
  final double homeBarHeight;
  final String viewType;
  final double iframeWidth;
  final double iframeHeight;

  const _PhoneFrame({
    required this.theme,
    required this.notchHeight,
    required this.homeBarHeight,
    required this.viewType,
    required this.iframeWidth,
    required this.iframeHeight,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = theme.brightness == Brightness.dark;
    final frameColor = isDark ? const Color(0xFF1A1A2E) : const Color(0xFFF0F0F0);
    final borderColor = isDark ? Colors.grey.shade800 : Colors.grey.shade400;
    final notchColor = isDark ? Colors.black : Colors.grey.shade300;
    final barColor = isDark ? Colors.grey.shade600 : Colors.grey.shade400;

    return Container(
      decoration: BoxDecoration(
        color: frameColor,
        borderRadius: BorderRadius.circular(44),
        border: Border.all(color: borderColor, width: 4),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.15),
            blurRadius: 40,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 60,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: notchHeight,
            decoration: BoxDecoration(
              color: frameColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Center(
              child: Container(
                width: 100,
                height: 28,
                decoration: BoxDecoration(
                  color: notchColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              child: HtmlElementView(viewType: viewType),
            ),
          ),
          Container(
            height: homeBarHeight,
            width: 120,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
