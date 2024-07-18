import 'package:comments/app/app.locator.dart';
import 'package:comments/app/app.logger.dart';
import 'package:comments/services/login_service.dart';
import 'package:comments/ui/views/sign_up/sign_up_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends FormViewModel {
  final formKey = GlobalKey<FormState>();

  final String signProcessing = "SignProcessing";
  final _logger = getLogger("SignUpViewModel");
  final LoginService _loginService = locator<LoginService>();
  void signUp() {
    setBusyForObject(signProcessing, true);
    if (formKey.currentState!.validate()) {
      _logger.i("Form validation passed.");
      _loginService.signUp(
          name: nameValue!, email: emailValue!, password: passwordValue!);
    } else {
      _logger.e("Form validation failed.");
    }

    setBusyForObject(signProcessing, false);
  }
}
