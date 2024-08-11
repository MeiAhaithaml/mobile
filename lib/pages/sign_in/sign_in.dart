import 'package:app2/common/utils/colors.dart';
import 'package:app2/common/utils/image_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../common/services/auth_service.dart';
import '../../common/widgets/app_shadow.dart';
import '../../common/widgets/app_text_fileds.dart';
import '../../common/widgets/button_widget.dart';
import '../../common/widgets/logo_and_name.dart';
import '../../common/widgets/text_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateEmail() async {
    if (formKey.currentState?.validate() ?? false) {
      await doLogin(emailController.text, passwordController.text);
    }
  }

  Future<void> doLogin(String email, String password) async {
    FocusScope.of(context).unfocus();
    EasyLoading.show(status: "Đang đăng nhập...");

    try {
      var response = await authService.login(email.trim(), password.trim());

      if (response['success'] == true) {
        await authService.saveUserToken(response['data']['tokenInfo']['accessToken']);
        EasyLoading.dismiss();
        Navigator.pushNamed(context, "/1");
      } else {
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Đăng nhập thất bại'),
        ));
      }
    } catch (e) {
      print('Co loi xay ra o: $e');
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Có lỗi xảy ra'),

      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    bool useMobileLayout = shortestSide < 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: useMobileLayout ? (size.height * 0.6) : (size.height * 0.5),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_login.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: (size.height * 0.1),
            right: 0,
            left: 0,
            child: const LogoName(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: text14Normal(
              text: "Office@Ecoit2023",
              color: AppColors.kHintTextFieldColor,
            ),
          ),
          Positioned(
            top: (size.height * 0.25),
            right: useMobileLayout ? 0 : size.width * 0.3,
            left: useMobileLayout ? 0 : size.width * 0.3,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(40),
              decoration: appBoxShadow(),
              child: Form( // Wrap fields in a Form widget
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: text24Normal(
                        text: "ĐĂNG NHẬP",
                        color: AppColors.kPrimaryColor,
                        font: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    appTextField(
                      controller: emailController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Vui lòng nhập tên tài khoản";
                        }
                        return null;
                      },
                      hintText: "Tài khoản",

                    ),
                    const SizedBox(height: 20),
                    appTextField(
                      controller: passwordController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Vui lòng nhập mật khẩu";
                        }
                        return null;
                      },
                      hintText: "Mật khẩu",
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => print('Forgot Password'),
                      child: Container(
                        margin: const EdgeInsets.only(left: 100),
                        child: text14Normal(
                          text: "Quên mật khẩu",
                          color: AppColors.kWarningColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          validateEmail();
                        }
                      },
                      child: Center(
                        child: appButton(buttonName: "ĐĂNG NHẬP"),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 1,
                            color: AppColors.kHintTextFieldColor,
                          ),
                          text14Normal(
                            text: "Hoặc đăng nhập bằng",
                            color: AppColors.kHintTextFieldColor,
                          ),
                          Container(
                            width: 30,
                            height: 1,
                            color: AppColors.kHintTextFieldColor,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        ImageRes.finger,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void configLoading({
  Color progressColor = AppColors.kPrimaryColor,
  Color backgroundColor = AppColors.kPrimaryLightColor,
  Color indicatorColor = AppColors.kPrimaryColor,
  Color textColor = AppColors.kPrimaryColor,
}) {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = progressColor
    ..backgroundColor = backgroundColor
    ..indicatorColor = indicatorColor
    ..textColor = textColor
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}