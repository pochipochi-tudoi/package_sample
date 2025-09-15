import 'package:flutter/material.dart';

class RedText extends StatelessWidget {
  final String text;
  const RedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.red));
  }
}
