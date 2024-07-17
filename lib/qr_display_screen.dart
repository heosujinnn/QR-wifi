import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDisplayScreen extends StatelessWidget {
  final String wifiId;
  final String password;

  const QRDisplayScreen({super.key, required this.wifiId, required this.password});

  @override
  Widget build(BuildContext context) {
    String wifiData = 'WIFI:T:WPA;S:$wifiId;P:$password;;';

    return Scaffold(
      appBar: AppBar(
        title: const Text('WiFi QR 코드'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi,
              size: 160,
              color: Colors.red,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  'Free Wifi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 16),
            QrImageView(
              data: wifiData,
              version: QrVersions.auto,
              size: 200,
            ),
            const SizedBox(height: 16),
            const Text('QR 코드를 스캔하여 WiFi에 연결하세요'),
            const SizedBox(height: 16),
            Text('Network Name: $wifiId',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.start,),
            Text('Password: $password',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.start,),
          ],
        ),
      ),
    );
  }
}
