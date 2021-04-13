import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeCardView {
  Widget build(_controller, context) {
    return Card(
      child: Container(
        color: Color(0xffffffff),
        padding: EdgeInsets.all(30),
        child: Obx(() => QrImage(
              data: _controller.qrcodeContext.value,
              version: QrVersions.auto,
              size: MediaQuery.of(context).size.width / 4 * 3,
              gapless: false,
              embeddedImage: NetworkImage(
                _controller.logoUrl.value,
              ),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(100, 80),
              ),
              errorStateBuilder: (cxt, err) {
                return Container(
                  child: Center(
                    child: Text(
                      "myQrcodeViewTips".tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
