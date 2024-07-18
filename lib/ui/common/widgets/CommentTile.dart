import 'package:comments/models/comment.dart';
import 'package:comments/ui/common/app_colors.dart';
import 'package:comments/ui/common/ui_helpers.dart';
import 'package:comments/ui/common/widgets/NameEmailRow.dart';
import 'package:flutter/material.dart';

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
