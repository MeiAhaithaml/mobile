import 'package:app2/common/utils/colors.dart';
import 'package:app2/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'app_shadow.dart';

Widget appTextField(
    {TextEditingController? controller,
      String iconName = "",
      String hintText = "Type in your info",
      bool obscureText =false,
      String? Function(String?)? validator,
      void Function(String value)? func}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 325,
          height: 60,
          decoration: appBoxDecorationTextFiled(),
          child: Row(
            children: [
              SizedBox(
                width: 180,
                height: 50,
                child: TextFormField(
                  validator: validator,
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: hintText,
                      hintStyle:const TextStyle(
                        color: AppColors.kHintTextFieldColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),

                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}