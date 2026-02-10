import 'package:flutter/material.dart';
import 'package:news_app/core/widget/connection_banner.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ConnectionBanner(),
        ),
      ],
    );
  }
}
