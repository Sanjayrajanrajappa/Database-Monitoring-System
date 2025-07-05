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
      backgroundColor: AppTheme.gray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Align(alignment: Alignment.topLeft,child: BackButton(
            color: AppTheme.purple,
          )),
        ],
      ),
    );
  }
}