import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './qrcodeController.dart';
import './components/actions.dart';
import './components/qrcode.dart';

class QrcodeView extends StatelessWidget {
  final QrcodeController _controller = Get.put(QrcodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('myQrcode'.tr),
          elevation: 0.0,
          actions: ActionsTraing().build(_controller),
        ),
        body: SafeArea(
            child: Container(
          child: Center(
            child: RepaintBoundary(
              key: _controller.globalKey.value,
              child: QrCodeCardView().build(_controller, context),
            ),
          ),
        )));
  }
}
