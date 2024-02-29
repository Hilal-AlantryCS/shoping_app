import 'package:flutter/material.dart';

class customGradient extends StatelessWidget {
  final Widget child;
  const customGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
