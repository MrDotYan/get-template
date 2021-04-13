import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class LayoutController extends GetxController {
  RxInt _navIndex = 0.obs;
  PageController _pageController = new PageController();

  get pageController => _pageController;
  get pageIndex => _navIndex;

  // 底部导航栏点击事件
  void onTapNavBarItem(index) {
    pageIndex.value = index;
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  // 设置app角标
  Future setAppIconBage(count) async {
    String support = await initPlatformState();
    print(support);
    if (support == "Supported") {
      FlutterAppBadger.updateBadgeCount(count);
    } else {
      Get.snackbar('bageSnack'.tr, "bageSnackMessage".tr);
    }
  }

  // 检测设备是否支持角标设置
  Future initPlatformState() async {
    String appBadgeSupported = "unknown";
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }

    return appBadgeSupported;
  }

  @override
  void onInit() async {
    await this.setAppIconBage(10);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }
}
