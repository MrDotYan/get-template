import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routers/router.dart';
import './binding/binding.dart';
import './internationalization/internationalization.dart';
import './service/servicesInit.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Internationalization(),
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        title: 'FuckProject',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        enableLog: true,
        logWriterCallback: localLogWriter,
        locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
        fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
        getPages: routers);
  }
}

void localLogWriter(String text, {bool isError = false}) {
  print(text);
}

Future<void> initServices() async {
  print('init services');
  await Get.putAsync(() => InitService().init());
  print('services runing end');
}
