import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeSacanner extends StatefulWidget {
  QrCodeSacanner({Key key, @required this.scaned}) : super(key: key);
  final Function scaned;
  @override
  _QrCodeSacannerState createState() => _QrCodeSacannerState();
}

class _QrCodeSacannerState extends State<QrCodeSacanner> {
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool flashStatus = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          _buildQrView(context),
          Positioned(bottom: 0, child: _createBottomGroup())
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // print(scanData.code); //context
      // print(scanData.format); //type
      // print(scanData.rawBytes); //buffer
      widget.scaned(scanData);
      this.controller.stopCamera();
    });
  }

  Widget _createBottomGroup() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: Color(0xffffffff))),
            child: IconButton(
                splashColor: Color(0xffffffff),
                icon: Icon(
                  this.flashStatus ? Icons.flash_on : Icons.flash_off,
                  color: Color(0xffffffff),
                ),
                onPressed: () async {
                  var flashStatus = await this.controller.getFlashStatus();
                  await this.controller.toggleFlash();
                  setState(() {
                    this.flashStatus = flashStatus;
                  });
                }),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: Color(0xffffffff))),
            child: IconButton(
                splashColor: Color(0xffffffff),
                icon: Icon(
                  Icons.cached,
                  color: Color(0xffffffff),
                ),
                onPressed: () async {
                  if (this.flashStatus) {
                    this.controller.toggleFlash();
                  }
                  await controller.flipCamera();
                }),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
