import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:comments/ui/common/widgets/CommentTile.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcLightGrey,
      appBar: AppBar(
        backgroundColor: kcLightBlue,
        title: const Text(
          'Comments',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final showFullEmail =
                  viewModel.remoteConfig.getBool("showFullEmail");
              viewModel.getComments(showFullEmail: showFullEmail);
            },
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
          IconButton(
              onPressed: () async {
                await viewModel.logout();
              },
              icon: const Icon(Icons.logout, color: Colors.white)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            children: [
              verticalSpaceSmall,
              Text("   Hi, ${viewModel.name ?? 'User'}!",
                  style: const TextStyle(fontSize: 20)),
              verticalSpaceSmall,
              viewModel.comments == null ? verticalSpaceMassive : Container(),
              if (viewModel.comments != null)
                for (var comment in viewModel.comments!)
                  CommentTile(comment: comment)
              else
                const Center(
                  child: SizedBox(
                    height: 50,
                    child: LoadingIndicator(
                      indicatorType: Indicator.lineScale,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    final showFullEmail = viewModel.remoteConfig.getBool("showFullEmail");
    viewModel.getName();
    viewModel.getComments(showFullEmail: showFullEmail);
    super.onViewModelReady(viewModel);

    // Listen for remote config changes
    viewModel.remoteConfig.onConfigUpdated.listen((event) async {
      await viewModel.remoteConfig.activate();
      final showFullEmail = viewModel.remoteConfig.getBool("showFullEmail");
      viewModel.getComments(showFullEmail: showFullEmail);
    });
  }
}
