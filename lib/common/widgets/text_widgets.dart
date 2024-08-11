import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/colors.dart';


Widget text24Normal({String text = "", color =AppColors.kBlackColor,font =FontWeight.normal}){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style:TextStyle(
        fontSize: 24,
        color: color,
        fontWeight: font),
  );
}
Widget text20Normal({String text = "", color =AppColors.kBlackColor,font =FontWeight.normal}){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style:TextStyle(
        fontSize: 20,
        color: color,
        fontWeight: FontWeight.bold),
  );
}
Widget text16Normal({String text = "",color =AppColors.kBorderInputColor,font =FontWeight.normal}){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: font),
  );
}
Widget text14Normal({String text = "",color =AppColors.kPrimaryColor,font =FontWeight.normal}){
  return  Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: font),
  );
}
Widget textUnderLine({String text=""}){
  return GestureDetector(
    onTap: (){

    },
    child:  Text(text, style: const TextStyle(
        fontSize: 12,
        color: AppColors.kBorderInputColor,
        fontWeight: FontWeight.normal,decoration: TextDecoration.underline,decorationColor: AppColors.kBorderInputColor),),
  );
}