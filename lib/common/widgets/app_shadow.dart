import 'package:flutter/material.dart';

import '../utils/colors.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.kWhiteColor,
      double radius = 15,
      double sR = 1,
      double bR = 2,
      BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxDecorationTextFiled(
    {Color color = AppColors.kWhiteColor,
      double radius = 15,
      double sR = 1,
      double bR = 2,
      Color borderColor = AppColors.kBorderInputColor}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}
BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.backgroundScaffoldColor,
      double radius = 15,
      double sR = 1,
      double bR = 2,
      BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}