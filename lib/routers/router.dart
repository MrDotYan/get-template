import 'package:get/get.dart';
import '../src/layout/layoutView.dart';
import '../src/scanner/scannerView.dart';
import '../src/qrcode/qrcodeView.dart';

final routers = [
  GetPage(name: '/', page: () => LayoutView()),
  GetPage(name: '/qrscanner', page: () => QrScannerView()),
  GetPage(name: '/qrcode', page: () => QrcodeView())
];
