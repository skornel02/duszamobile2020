import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'dart:async';
import 'file:///E:/Projects/duszamobile2020/lib/navigation/route_generator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'localizations.dart';

String startPage;

ThemeData themeData;

bool newComer = false;
bool isLoggedIn = true;
bool isFromNotification = false;


Locale preferredLocale;

final router = FluroRouter();


void main() async{
  enableFlutterDriverExtension();
  defineRoutes(router);
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();


  if(isLoggedIn){
    if(!isFromNotification){
      startPage = "/";
    }else {
      startPage = "/tasksTomorrow";
    }
  }else if(newComer){
    startPage = "intro";
  }
  else{
    startPage = "login";
  }


  startPage = "/cars";

  runApp(EasyLocalization(
      preloaderWidget: Center(
        child: Image.asset(
          'assets/images/Logo.png',
        ),
      ),
      path: 'assets/langs',
      useOnlyLangCode: true,
      supportedLocales: supportedLocals,
      child: App()
  ));
}

class App extends StatefulWidget{

  const App({Key key}) : super(key: key);

  @override
  _App createState() => _App();
}

class _App extends State<App> with WidgetsBindingObserver{
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
    if(state == AppLifecycleState.paused){

    }
    else if(state == AppLifecycleState.resumed){

    }

    else if(state == AppLifecycleState.detached){

    }
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
              locale: context.locale,
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
              child: MaterialApp(

                initialRoute: startPage,
                onGenerateRoute: router.generator,
                title: "appname".loc(context) ?? "Duszamobile2020",
                showPerformanceOverlay: false,
                theme: theme,
                localizationsDelegates: [
                  HazizzLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: supportedLocals,

              ),
          );
        }
    );
  }
}