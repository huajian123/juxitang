import 'package:flutter/material.dart';

// 表单中的前缀图片有间距的问题，自己调整。
class FlutterRepair {
  static Widget buildCustomPrefixIcon(IconData iconData ,Color color,) {
    return Container(
      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }

}
