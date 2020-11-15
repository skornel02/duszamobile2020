import 'package:duszamobile2020/route/add_car_page.dart';
import 'package:duszamobile2020/route/add_evignette_page.dart';
import 'package:duszamobile2020/route/add_refuel_page.dart';
import 'package:duszamobile2020/route/car_settings_page.dart';
import 'package:duszamobile2020/route/car_page.dart';
import 'package:duszamobile2020/route/car_editor_page.dart';
import 'package:duszamobile2020/route/cars_page.dart';
import 'package:duszamobile2020/route/settings_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void defineRoutes(FluroRouter router) {
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
    return AddCarPage();
  }));
  router.define("/cars/:car_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "statistics");
  }));

  router.define("/cars/:car_id/statistics", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "statistics");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/settings", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    debugPrint(params["car_id"][0]);
    return CarSettingsPage(params["car_id"][0]);
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/repairs", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "repairs");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/repairs/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddRefuelPage();
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/refuels", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "refuels");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/reminders", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "reminders");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/evignettes", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "evignettes");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/evignettes/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddEVignettePage();
  }), transitionType: TransitionType.none);

  // it is also possible to define the route transition to use
  // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
}
