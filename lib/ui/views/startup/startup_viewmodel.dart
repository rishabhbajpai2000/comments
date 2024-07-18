import 'package:comments/services/login_service.dart';
import 'package:stacked/stacked.dart';
import 'package:comments/app/app.locator.dart';
import 'package:comments/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    var isLoggedIn = await _loginService.isSignedIn();
    if (isLoggedIn) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithInitiaWelcomeScreenView();
    }
  }
}
