import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class QrcodeController extends GetxController {
  RxString qrcodeContext = "my qrcode ； 我的二维码".obs;
  RxString logoUrl = "https://www.materialpalette.com/img/shecodes.png".obs;

  Rx<GlobalKey> globalKey = GlobalKey().obs;

  Future<void> saveQrcode() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.value.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      if (result["isSuccess"]) {
        Fluttertoast.showToast(msg: "saveTips".tr);
        getBack();
      } else {
        Fluttertoast.showToast(msg: "errorTips".tr);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void getBack() {
    Get.back();
  }

  void resetQrcode() {
    Random ran = new Random();
    qrcodeContext.value = ran.nextInt(32).toString();
    getBack();
  }

  void cancel() {
    getBack();
  }

  void scannerQrcode() {
    Get.toNamed('/qrscanner');
  }
}
