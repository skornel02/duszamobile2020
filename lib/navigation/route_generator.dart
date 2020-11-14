import 'package:duszamobile2020/route/add_evignette_page.dart';
import 'package:duszamobile2020/route/add_refuel_page.dart';
import 'package:duszamobile2020/route/auto_settings_page.dart';
import 'package:duszamobile2020/route/main_page.dart';
import 'package:duszamobile2020/route/car_editor_page.dart';
import 'package:duszamobile2020/route/cars_page.dart';
import 'package:duszamobile2020/route/settings_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void defineRoutes(FluroRouter router) {
  router.define("/main", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("settings");
  }), transitionType: TransitionType.material);
  router.define("/settings", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SettingsPage();
  }), transitionType: TransitionType.material);
  router.define("/cars", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarsPage();
  }));
  router.define("/cars/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarEditorPage("create");
  }));
  router.define("/cars/:car_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("statistics");
  }));

  router.define("/cars/:car_id/statistics", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("statistics");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/settings", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarEditorPage("edit");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/repairs", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("repairs");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/repairs/add", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddRefuelPage();
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/refuels", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("refuels");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/reminders", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("reminders");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/evignettes", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("evignettes");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/evignettes/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddEVignettePage();
  }), transitionType: TransitionType.none);

  // it is also possible to define the route transition to use
  // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
}
