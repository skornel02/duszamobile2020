import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:duszamobile2020/widgets/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:duszamobile2020/navigation/route_generator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';

String startPage;

ThemeData themeData;

bool newComer = false;
bool isLoggedIn = true;
bool isFromNotification = false;

Locale preferredLocale;

final router = FluroRouter();

void main() async {
  defineRoutes(router);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final defaultLocale = await getCurrentLocale();
  setCurrentLocale(defaultLocale);

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

  runApp(App(
    defaultLocale: defaultLocale,
  ));
}

class App extends StatefulWidget {
  final String defaultLocale;

  const App({Key key, this.defaultLocale}) : super(key: key);

  @override
  _App createState() => _App();
}

class _App extends State<App> with WidgetsBindingObserver {
  DateTime currentBackPressTime;
  CarRepository _repository = CarRepository();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _repository.carsCubit.close();
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
    return RepositoryProvider(
      create: (context) => _repository,
      child: BlocProvider(
        create: (context) => LocaleCubit(widget.defaultLocale),
        child: DesignWrapper(
          builder: (theme) => MaterialApp(
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
      ),
    );
  }
}

class LocaleWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class DesignWrapper extends StatelessWidget {
  final Function builder;

  const DesignWrapper({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, String>(
      builder: (context, locale) {
        return DynamicTheme(
            data: (brightness) => new ThemeData(
                  appBarTheme: AppBarTheme(centerTitle: true, textTheme: null),
                  floatingActionButtonTheme: null,
                  brightness: brightness,
                ),
            themedWidgetBuilder: (context, theme) {
              return StyledToast(
                locale: Locale(locale),
                textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                backgroundColor: Color(0x99000000),
                borderRadius: BorderRadius.circular(5.0),
                textPadding:
                    EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
                toastAnimation: StyledToastAnimation.fade,
                reverseAnimation: StyledToastAnimation.fade,
                curve: Curves.fastOutSlowIn,
                reverseCurve: Curves.fastLinearToSlowEaseIn,
                dismissOtherOnShow: true,
                movingOnWindowChange: true,
                child: builder(theme),
              );
            });
      },
    );
  }
}
