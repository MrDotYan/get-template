import '../homeController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../components/paddingDivider.dart';

class MyDrawer extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xfff5f5f5))),
            ),
            child: Container(),
          ),
          ListTile(
            title: Text("changeLanguage".tr),
            leading: Icon(Icons.translate),
            onTap: () {
              controller.changeLanguage();
            },
          ),
          PaddingDivider(),
          ListTile(
            title: Text("changeTheme".tr),
            leading: Icon(Icons.brightness_medium),
            onTap: () {
              controller.changTheme();
            },
          ),
          PaddingDivider(),
          ListTile(
            title: Text("myQrcode".tr),
            leading: Icon(Icons.image),
            onTap: () {
              controller.createQrcode();
            },
          )
        ],
      ),
    );
  }
}
