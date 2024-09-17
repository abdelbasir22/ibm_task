import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        text,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      )),
    );
  }
}
