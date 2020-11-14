import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'dart:async';
import 'package:duszamobile2020/navigation/route_generator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:duszamobile2020/generated/l10n.dart';

String startPage;

ThemeData themeData;

bool newComer = false;
bool isLoggedIn = true;
bool isFromNotification = false;

Locale preferredLocale;

final router = FluroRouter();

void main() async {
<<<<<<< HEAD
=======
  //enableFlutterDriverExtension();
>>>>>>> 5f2aff444d8569805e0704b73da71d8ee9ad3bcb
  defineRoutes(router);
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  if (isLoggedIn) {
    if (!isFromNotification) {
      startPage = "/";
    } else {
      startPage = "/tasksTomorrow";
    }
  } else if (newComer) {
    startPage = "intro";
  } else {
    startPage = "login";
  }

  startPage = "/cars";

  runApp(App());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _App createState() => _App();
}

class _App extends State<App> with WidgetsBindingObserver {
  DateTime currentBackPressTime;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.detached) {}
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        data: (brightness) => new ThemeData(
              appBarTheme: AppBarTheme(centerTitle: true, textTheme: null),
              floatingActionButtonTheme: null,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return StyledToast(
            locale: Locale.fromSubtags(languageCode: "en"),
            textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
            backgroundColor: Color(0x99000000),
            borderRadius: BorderRadius.circular(5.0),
            textPadding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
            toastAnimation: StyledToastAnimation.fade,
            reverseAnimation: StyledToastAnimation.fade,
            curve: Curves.fastOutSlowIn,
            reverseCurve: Curves.fastLinearToSlowEaseIn,
            dismissOtherOnShow: true,
            movingOnWindowChange: true,
            child: RepositoryProvider(
              create: (context) => CarRepository(),
              child: MaterialApp(
                initialRoute: startPage,
                onGenerateRoute: router.generator,
                title: S.current?.title ?? "Duszamobile2020",
                showPerformanceOverlay: false,
                theme: theme,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
              ),
            ),
          );
        });
  }
}
