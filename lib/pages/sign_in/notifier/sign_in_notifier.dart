import 'package:app2/pages/sign_in/notifier/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super(const SignInState());
  void onUserEmailChange(String email){
    state =state.copyWidth(email: email);
  }
  void onUserPasswordChange(String password){
    state =state.copyWidth(password: password);
  }
}

final signInNotifierProvider = StateNotifierProvider<SignInNotifier,SignInState>((ref)=> SignInNotifier());