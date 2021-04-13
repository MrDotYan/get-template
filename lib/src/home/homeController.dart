import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Locale localeEnglish = Locale('en', 'US');
  Locale localeChinese = Locale('zh', "CN");
  bool isChinese = true;

  changeLanguage() {
    String countryCode = Get.locale.countryCode;

    if (countryCode != 'CN') {
      Locale currentLocale = localeChinese;
      Get.updateLocale(currentLocale);
    } else {
      Locale currentLocale = localeEnglish;
      Get.updateLocale(currentLocale);
    }
  }

  void changTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }

  void scanQrcode() {
    Get.toNamed('/qrscanner');
  }

  void createQrcode() {
    Get.toNamed('/qrcode');
  }
}
