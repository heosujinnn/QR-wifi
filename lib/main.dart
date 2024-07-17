import 'package:flutter/material.dart';
import 'package:qr_wifi/qr_code_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRCodeScreen(),
    );
  }
}