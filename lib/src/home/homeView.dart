import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homeController.dart';
import './components/Drawer.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('bottomTabsHome'.tr),
          elevation: 0.0,
          actions: [
            IconButton(
                icon: Icon(Icons.crop_free),
                onPressed: () {
                  controller.scanQrcode();
                })
          ],
        ),
        drawer: MyDrawer());
  }
}
