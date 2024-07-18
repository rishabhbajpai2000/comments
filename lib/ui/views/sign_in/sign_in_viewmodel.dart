import 'package:comments/app/app.locator.dart';
import 'package:comments/services/login_service.dart';
import 'package:comments/ui/views/sign_in/sign_in_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends FormViewModel {
  final formKey = GlobalKey<FormState>();
  final LoginService _loginService = locator<LoginService>();
  final String loginProcessing = "LoginProcessing";
  Future<void> login() async {
    setBusy(true);
    if (formKey.currentState!.validate()) {
      await _loginService.signIn(email: emailValue!, password: passwordValue!);
    }
    setBusy(false);
  }
}
