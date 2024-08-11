import 'package:app2/common/utils/colors.dart';
import 'package:app2/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../utils/image_res.dart';

class LogoName extends StatelessWidget {
  const LogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo_app.png'),
        SizedBox(height: 16,),
        text16Normal(text: "BỘ Y TẾ BỆNH VIỆN BẠCH MAI",color: AppColors.kWhiteColor,),
      ],
    );
  }
}
