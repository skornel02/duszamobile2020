import 'package:duszamobile2020/notification_service.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:duszamobile2020/cubits/locale.dart';
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

ThemeData themeData;

Locale preferredLocale;

final router = FluroRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  defineRoutes(router);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final defaultLocale = await getCurrentLocale();
  final defaultDarkMode = await getDarkMode();
  final startingPage = await getStartingPage();
  print("Initial route: $startingPage");

  CarRepository carRepository = new CarRepository();

  carRepository
      .getCars()
      .then((value) => debugPrint("ca212r: " + value.length.toString()));

  (await carRepository.getCars()).forEach((car) {
    debugPrint("car: " + car.name);
    car.getNotifications.forEach((reminder) {
      debugPrint("SAdasnd: " + reminder.name);
      NotificationService.showNotificationWithReminder(reminder);
    });
  });


  runApp(App(
    defaultLocale: defaultLocale,
    defaultDarkMode: defaultDarkMode,
    initialRoute: startingPage,
  ));
}

class App extends StatefulWidget {
  final String defaultLocale;
  final String initialRoute;
  final bool defaultDarkMode;

  const App(
      {Key key,
      @required this.defaultLocale,
      @required this.initialRoute,
      @required this.defaultDarkMode})
      : super(key: key);

  @override
  _App createState() => _App();
}

class _App extends State<App> with WidgetsBindingObserver {
  DateTime currentBackPressTime;
  CarRepository _repository = CarRepository();

  _fixLocale() async {
    final locale = await getCurrentLocale();
    await setCurrentLocale(locale);
  }

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
    _fixLocale();

    return RepositoryProvider(
      create: (context) => _repository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocaleCubit(widget.defaultLocale)),
        ],
        child: DesignWrapper(
          defaultDarkMode: widget.defaultDarkMode,
          builder: (theme) => MaterialApp(
            initialRoute: widget.initialRoute,
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
  final bool defaultDarkMode;
  final Function builder;

  const DesignWrapper(
      {Key key, @required this.builder, @required this.defaultDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, String>(
      builder: (context, locale) {
        return DynamicTheme(
            defaultBrightness:
                defaultDarkMode ? Brightness.dark : Brightness.light,
            data: (brightness) => new ThemeData(
              fontFamily: 'Manrope',
                  appBarTheme: AppBarTheme(centerTitle: true),
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
