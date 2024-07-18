import 'package:comments/app/app.locator.dart';
import 'package:comments/app/app.logger.dart';
import 'package:comments/models/comment.dart';
import 'package:comments/services/comments_service.dart';
import 'package:comments/services/login_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<Comment>? comments;
  final CommentsService _commentsService = locator<CommentsService>();
  final LoginService _loginService = locator<LoginService>();
  final _logger = getLogger('HomeViewModel');
  void getComments() async {
    comments = null;
    rebuildUi();
    comments = await _commentsService.getComments();
    rebuildUi();
  }

  Future<void> logout() async {
    await _loginService.logout();
    notifyListeners();
  }
}
