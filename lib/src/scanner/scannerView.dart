import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/qrcodeScanner.dart';

class QrScannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GetPlatform.isAndroid || GetPlatform.isIOS
                ? QrCodeSacanner(
                    scaned: (code) {
                      print(code);
                    },
                  )
                : Center(
                    child: Text('scannerViewTips'.tr),
                  )));
  }
}
