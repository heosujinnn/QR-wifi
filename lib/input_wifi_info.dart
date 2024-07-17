import 'package:flutter/material.dart';
import 'package:qr_wifi/qr_display_screen.dart';

class InputWifiInfo extends StatefulWidget {
  const InputWifiInfo({super.key});

  @override
  State<InputWifiInfo> createState() => _InputWifiInfoState();
}

class _InputWifiInfoState extends State<InputWifiInfo> {
  final TextEditingController _wifiIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _wifiSSID = '';
  String _wifiPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WiFi QR 코드'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: Text('아이디와 비밀번호를 정확하게 입력해야합니다',),),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: TextField(
                  controller: _wifiIdController,
                  decoration: const InputDecoration(
                    labelText: 'WiFi 아이디 (SSID)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _wifiSSID = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'WiFi 비밀번호',
                ),
                onChanged: (value) {
                  setState(() {
                    _wifiPassword = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRDisplayScreen(
                        wifiId: _wifiSSID,
                        password: _wifiPassword,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 3, 199, 90),
                  surfaceTintColor: const Color.fromARGB(255, 3, 199, 90),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('QR 코드 생성'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
