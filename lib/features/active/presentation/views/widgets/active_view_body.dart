import 'package:flutter/material.dart';

class ActiveViewBody extends StatelessWidget {
  const ActiveViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Active page",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }
}
