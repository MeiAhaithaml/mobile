import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:app2/pages/sign_in/sign_in.dart';
import 'package:app2/pages/test_easy_loading/test.dart';

import 'common/utils/colors.dart';

void main() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.kPrimaryColor
    ..backgroundColor = AppColors.kPrimaryLightColor
    ..indicatorColor = AppColors.kPrimaryColor
    ..textColor = AppColors.kPrimaryColor
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SignIn(),
        '/1': (context) => const TestEasyLoading(),
      },
      initialRoute: '/',
      builder: EasyLoading.init(), // Initialize EasyLoading
    );
  }
}
