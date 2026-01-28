import 'package:cinetrack/core/widget/background_color.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundColor(),
      child: Scaffold(backgroundColor: Colors.transparent, body: child),
    );
  }
}
