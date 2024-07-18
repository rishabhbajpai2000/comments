import 'package:comments/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:comments/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:comments/ui/views/home/home_view.dart';
import 'package:comments/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:comments/services/comments_service.dart';
import 'package:comments/services/login_service.dart';
import 'package:comments/ui/views/initia_welcome_screen/initia_welcome_screen_view.dart';
import 'package:comments/ui/views/sign_in/sign_in_view.dart';
import 'package:comments/ui/views/sign_up/sign_up_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: InitiaWelcomeScreenView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: SignUpView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CommentsService),
    LazySingleton(classType: LoginService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
