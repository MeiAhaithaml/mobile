import 'package:app2/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/message.dart';


class SignInController {
  WidgetRef ref;

  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("your email is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("your password is empty");
      return;
    }
  }}


