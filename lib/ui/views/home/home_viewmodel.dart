import 'package:comments/app/app.locator.dart';

import 'package:comments/models/comment.dart';
import 'package:comments/services/comments_service.dart';
import 'package:comments/services/login_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<Comment>? comments;
  String? name;
  final CommentsService _commentsService = locator<CommentsService>();
  final LoginService _loginService = locator<LoginService>();
  final remoteConfig = FirebaseRemoteConfig.instance;

  void getComments({required bool showFullEmail}) async {
    comments = null;
    rebuildUi();
    comments = await _commentsService.getComments();
    if (showFullEmail == false) {
      for (var comment in comments!) {
        comment.email = trimEmail(comment.email);
      }
    }

    rebuildUi();
  }

  String trimEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) {
      return email;
    }
    final namePart = parts[0];
    final domainPart = parts[1];
    final trimmedNamePart =
        namePart.length > 3 ? '${namePart.substring(0, 3)}***' : namePart;
    return '$trimmedNamePart@$domainPart';
  }

  Future<void> logout() async {
    await _loginService.logout();
    notifyListeners();
  }

  void getName() async{
    name =await _loginService.getName();
    rebuildUi();
  }
}
