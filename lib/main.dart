import 'package:flutter/material.dart';
import 'package:qr_wifi/input_wifi_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputWifiInfo(),
    );
  }
}