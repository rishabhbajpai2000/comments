import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.g.dart';
part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const Comment._();
  const factory Comment({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
