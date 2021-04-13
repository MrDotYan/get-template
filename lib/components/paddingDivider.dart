import 'package:flutter/material.dart';

class PaddingDivider extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        color: Color(0xfff5f5f5),
      ),
    );
  }
}
