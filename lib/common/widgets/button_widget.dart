import 'package:app2/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'app_shadow.dart';


Widget appButton({
  String buttonName = "",
  double width = 325,
  double height = 50,
  bool isLogin = true,
  BuildContext? context,
  void Function()? func,
}) {
  return GestureDetector(
    onTap:func,
    child: Container(
        width: width,
        height: height,
        decoration: appBoxShadow(
            color: isLogin ? AppColors.kPrimaryColor : AppColors.kPrimaryColor,
            border: Border.all(color: Colors.transparent)),
        child: Center(
            child: text16Normal(
                text: buttonName,
                font: FontWeight.bold,
                color: isLogin
                    ? AppColors.kWhiteColor
                    : AppColors.kPrimaryColor))),
  );
}
