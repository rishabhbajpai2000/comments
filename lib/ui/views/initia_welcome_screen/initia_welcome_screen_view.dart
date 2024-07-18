import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  InitiaWelcomeScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InitiaWelcomeScreenViewModel();
}
