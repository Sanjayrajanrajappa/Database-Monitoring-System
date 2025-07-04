import 'package:dbms/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Extensive extends StatefulWidget {
  const Extensive({super.key});

  @override
  State<Extensive> createState() => _ExtensiveState();
}

class _ExtensiveState extends State<Extensive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.green,
    );
  }
}