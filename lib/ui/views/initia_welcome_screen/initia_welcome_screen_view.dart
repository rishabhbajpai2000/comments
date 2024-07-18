import 'package:comments/app/app.router.dart';
import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'initia_welcome_screen_viewmodel.dart';

class InitiaWelcomeScreenView
    extends StackedView<InitiaWelcomeScreenViewModel> {
  const InitiaWelcomeScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InitiaWelcomeScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(child: Container()),
            Image.asset(
              "assets/initialWelcomeScreen.png",
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 30,
                  color: kcLightBlue,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                NavigationService().navigateToSignUpView();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kcLightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Create An Account",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            InkWell(
              onTap: () {
                NavigationService().navigateToSignInView();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: kcLightBlue, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text("Sign In",
                      style: TextStyle(
                          color: kcLightBlue, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  InitiaWelcomeScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InitiaWelcomeScreenViewModel();
}
