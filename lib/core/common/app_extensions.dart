import 'package:flutter/material.dart';


extension CustomBox2 on int {
  Widget widthBox() {
    return SizedBox(width: toDouble());
  }

  Widget heightBox() {
    return SizedBox(height: toDouble());
  }
}

extension CustomBox on double {
  Widget widthBox() {
    return SizedBox(width: toDouble());
  }

  Widget heightBox() {
    return SizedBox(height: toDouble());
  }
}

extension SuperTrim on String {
  String superTrim(){
    return toLowerCase().replaceAll(" ", "").trim();
  }
}

