import 'package:comments/app/app.router.dart';
import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:comments/ui/common/widgets/InputFieldSignInSignUp.dart';
import 'package:comments/ui/common/widgets/LoginSignUpButton.dart';
import 'package:comments/ui/views/sign_in/sign_in_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'sign_in_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class SignInView extends StackedView<SignInViewModel> with $SignInView {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcLightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcLightGrey,
        title: const Text(
          'Comments',
          style: TextStyle(color: kcLightBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              Expanded(child: Container()),
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
                value: viewModel.busy(viewModel.loginProcessing)
                    ? "Logging In..."
                    : "Login",
                onPressed: () async {
                  if (viewModel.busy(viewModel.loginProcessing)) return;
                  await viewModel.login();
                },
              ),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New Here? ", style: TextStyle(fontSize: 16)),
                  InkWell(
                    onTap: () {
                      NavigationService().navigateToSignUpView();
                    },
                    child: const Text("Signup",
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
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();
  @override
  void onViewModelReady(SignInViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }
}
