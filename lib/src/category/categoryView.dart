import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './categoryController.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('bottomTabsCategory'.tr),
          elevation: 0.0,
        ),
        body: SafeArea(child: Text('MyController')));
  }
}
