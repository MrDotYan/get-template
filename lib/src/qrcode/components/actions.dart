import 'package:flutter/material.dart';
import '../../../components/br.dart';
import '../../../components/paddingDivider.dart';
import 'package:get/get.dart';

class ActionsTraing {
  List<Widget> build(_controller) {
    return [
      IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {
            Get.bottomSheet(Container(
              height: Get.height / 5 * 2,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? Color(0xff666666) : Color(0xffffffff),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'myQrcodeSaveQrcode'.tr,
                      textAlign: TextAlign.center,
                    ),
                    onTap: _controller.saveQrcode,
                  ),
                  PaddingDivider(),
                  ListTile(
                    title: Text(
                      'myQrcodeScannerQrcode'.tr,
                      textAlign: TextAlign.center,
                    ),
                    onTap: _controller.scannerQrcode,
                  ),
                  PaddingDivider(),
                  ListTile(
                    title: Text(
                      'MyQrcodeResetQrcode'.tr,
                      textAlign: TextAlign.center,
                    ),
                    onTap: _controller.resetQrcode,
                  ),
                  Br(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'cancel'.tr,
                      textAlign: TextAlign.center,
                    ),
                    onTap: _controller.cancel,
                  ),
                ],
              ),
            ));
          })
    ];
  }
}
