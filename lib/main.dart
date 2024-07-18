import 'package:comments/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:comments/app/app.bottomsheets.dart';
import 'package:comments/app/app.dialogs.dart';
import 'package:comments/app/app.locator.dart';
import 'package:comments/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
