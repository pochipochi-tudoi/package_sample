import 'package:flutter/material.dart';
import 'package:m3e_sample/m3e_sample.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M3E Sample',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3D5AFE), // 好きなシードカラー
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('M3E Button Demo')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [RedText(text: 'qqqq')],
        ),
      ),
    );
  }
}
