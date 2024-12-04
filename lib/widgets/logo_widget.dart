// lib/widgets/logo_widget.dart
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;

  const LogoWidget({Key? key, this.size = 100.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logomascota.png',
      width: size,
      height: size,
    );
  }
}
