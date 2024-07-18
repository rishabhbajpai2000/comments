import 'package:comments/app/app.router.dart';
import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:comments/ui/common/widgets/InputFieldSignInSignUp.dart';
import 'package:comments/ui/common/widgets/LoginSignUpButton.dart';
import 'package:comments/ui/views/sign_up/sign_up_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'sign_up_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'name'),
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcLightGrey,
        title: const Text(
          'Comments',
          style: TextStyle(color: kcLightBlue, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: kcLightGrey,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              Expanded(child: Container()),
              InputFieldSignInSignUp(
                controller: nameController,
                heading: "Name",
              ),
              InputFieldSignInSignUp(
                controller: emailController,
                heading: "Email",
                emailKeyboard: true,
              ),
              InputFieldSignInSignUp(
                controller: passwordController,
                heading: "Password",
                obscureText: true,
              ),
              Expanded(child: Container()),
              LoginSignUpButton(
                value: "Sign Up",
                isActive: !viewModel.isBusy,
                onPressed: () async {
                  if (viewModel.isBusy) return;
                  await viewModel.signUp();
                },
              ),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account? ",
                      style: TextStyle(fontSize: 16)),
                  InkWell(
                    onTap: () {
                      NavigationService().navigateToSignInView();
                    },
                    child: const Text("Login",
                        style: TextStyle(
                            fontSize: 16,
                            color: kcLightBlue,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();

  @override
  void onViewModelReady(SignUpViewModel viewModel) {
    // TODO: implement onViewModelReady
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }
}
