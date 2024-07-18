import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comments/app/app.dialogs.dart';
import 'package:comments/app/app.locator.dart';
import 'package:comments/app/app.logger.dart';
import 'package:comments/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginService {
  final _logger = getLogger('LoginService');
  final db = FirebaseFirestore.instance;
  final _dialogService = locator<DialogService>();
  logout() {
    FirebaseAuth.instance.signOut();
    NavigationService().clearStackAndShow(Routes.startupView);
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    _logger.i('Signing up with $name, $email, $password');
    try {
      UserCredential value = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String userId = value.user!.uid;
      final user = <String, dynamic>{"name": name, "email": email};
      await db.collection("users").doc(userId).set(user);
      NavigationService().clearStackAndShow(Routes.startupView);
    } on FirebaseAuthException catch (e) {
      _logger.e('Error signing up: $e');
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Error Signing Up',
        description: 'Details: ${e.message}',
      );
    } on FirebaseException catch (e) {
      _logger.e('Error in database handling: $e');
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Error Saving your details in DB. ',
        description: 'Details: ${e.message}',
      );
    }
  }

  Future<void> signIn({String? email, String? password}) async {
    await FirebaseAuth.instance
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

  Future<String> getName() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var doc = await db.collection("users").doc(user.uid).get();
      return doc.get("name");
    } else {
      return "Unknown";
    }
  }
}
