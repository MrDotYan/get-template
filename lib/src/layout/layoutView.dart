import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'layoutController.dart';

import '../category/categoryView.dart';
import '../home/homeView.dart';
import '../personal/personalView.dart';

class LayoutView extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [HomeView(), CategoryView(), PersonalView()],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.pageIndex.value,
            onTap: controller.onTapNavBarItem,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "bottomTabsHome".tr),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "bottomTabsCategory".tr),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "bottomTabsPersonal".tr),
            ],
          )),
    );
  }
}
