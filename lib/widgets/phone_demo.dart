import 'dart:ui_web' as ui_web;
import 'package:web/web.dart' as web;
import 'package:flutter/material.dart';

class PhoneDemo extends StatefulWidget {
  final String url;
  final String title;

  const PhoneDemo({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<PhoneDemo> createState() => _PhoneDemoState();
}

class _PhoneDemoState extends State<PhoneDemo> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'iframe-${widget.title}';
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int id) {
      final iframe = web.HTMLIFrameElement()
        ..src = widget.url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allow = 'accelerometer; camera; geolocation; microphone; clipboard-write'
        ..setAttribute('loading', 'eager');
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}

void showPhoneDemo(BuildContext context, String url, String title) {
  final size = MediaQuery.of(context).size;
  final phoneWidth = 375.0;
  final phoneHeight = 720.0;

  showDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Demo',
    barrierColor: Colors.black87,
    builder: (ctx) => Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: phoneWidth,
                height: phoneHeight,
                margin: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 40,
                      spreadRadius: 8,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade800,
                    width: 4,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(36),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(36),
                        ),
                        child: PhoneDemo(url: url, title: title),
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 120,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: () => Navigator.of(ctx).pop(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
