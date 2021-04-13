import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './personalController.dart';

class PersonalView extends GetView<PersonalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('bottomTabsPersonal'.tr),
          elevation: 0.0,
        ),
        body: SafeArea(child: Text('MyController')));
  }
}
