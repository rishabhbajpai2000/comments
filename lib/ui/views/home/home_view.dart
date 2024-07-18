import 'package:comments/models/comment.dart';
import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
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
              viewModel.getComments();
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
              viewModel.comments == null ? verticalSpaceMassive : Container(),
              if (viewModel.comments != null)
                for (var comment in viewModel.comments!)
                  CommentTile(comment: comment)
              else
                const Center(
                  child: CircularProgressIndicator(),
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
    viewModel.getComments();
    super.onViewModelReady(viewModel);
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.comment,
  });
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: kcDarkGreyColor,
                  radius: 30,
                  child: Text(
                    comment.name[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                horizontalSpaceSmall,
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameEmailRow(heading: 'Name', value: comment.name),
                      NameEmailRow(heading: 'Email', value: comment.email),
                      SizedBox(
                        height: 50,
                        child: Text(
                          comment.body,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class NameEmailRow extends StatelessWidget {
  const NameEmailRow({super.key, required this.heading, required this.value});

  final String heading;
  final String value;
  String trimString(String value) {
    if (value.length > 18) {
      return '${value.substring(0, 18)}...';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${heading}: ", style: const TextStyle(color: kcDarkGreyColor)),
        Text(
          trimString(value),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
