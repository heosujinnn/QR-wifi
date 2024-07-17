import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('우리집 QR WIFI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              ///WIFI:T:<암호화 유형>;S:<SSID>;P:<비밀번호>;;
              data: 'WIFI:T:WPA;S:SK_WiFiGIGA72F3;P:1709013535;;',
              version: QrVersions.auto,
              size: 200,
            ),
            const SizedBox(height: 20),
            const Text('스캔하여 다음으로 이동')
          ],
        ),
      ),
    );
  }

  // 스캔된 QR 코드 데이터를 사용하여 와이파이에 연결
  void connectToWiFi(String ssid, String password) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.wifi) {
      // 현재 WiFi에 연결되어 있는 경우
      print('이미 WiFi에 연결되어 있습니다.');

    } else if (connectivityResult == ConnectivityResult.mobile) {
      // 모바일 데이터 네트워크에 연결되어 있는 경우
      print('모바일 데이터 네트워크에 연결되어 있습니다.');

    } else if (connectivityResult == ConnectivityResult.none) {
      // 네트워크에 연결되어 있지 않은 경우
      print('네트워크에 연결되어 있지 않습니다.');
    } else {
      // 실패 할 경우
      print('실패..');
    }
  }
}