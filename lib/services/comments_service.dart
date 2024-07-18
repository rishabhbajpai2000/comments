import 'dart:convert';

import 'package:comments/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentsService {
  Future<List<Comment>> getComments() async {
    List<Comment> comments = [];
    // Api Call
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body) as List<dynamic>;
      comments = body.map((dynamic item) => Comment.fromJson(item)).toList();
    } else {
      throw 'Failed to load comments';
    }
    return comments;
  }
}
