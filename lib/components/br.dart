import 'package:flutter/material.dart';

class Br extends StatelessWidget {
  const Br({Key key, this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      color: Color(0xfff5f5f5),
    );
  }
}
