import 'package:comments/app/app.dialogs.dart';
import 'package:comments/app/app.locator.dart';
import 'package:comments/app/app.logger.dart';
import 'package:comments/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginService {
  final _logger = getLogger('LoginService');
  final _dialogService = locator<DialogService>();
  logout() {
    FirebaseAuth.instance.signOut();
    NavigationService().clearStackAndShow(Routes.startupView);
  }

  void signUp(
      {required String name,
      required String email,
      required String password}) async {
    _logger.i('Signing up with $name, $email, $password');
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // TODO: Save the name information in the database.
      NavigationService().clearStackAndShow(Routes.startupView);
    }).onError((error, stackTrace) {
      FirebaseAuthException e = error as FirebaseAuthException;

      _logger.e('Error signing up: $error');
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Error Signing Up',
        description: 'Details: ${e.message}',
      );
    });
  }

  Future<void> signIn({String? email, String? password}) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      NavigationService().clearStackAndShow(Routes.startupView);
    }).onError((error, stackTrace) {
      _logger.e('Error signing in: $error');
      FirebaseAuthException e = error as FirebaseAuthException;
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Error SigningIn',
        description: 'Details: ${e.message}',
      );
    });
  }

  Future<bool> isSignedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
