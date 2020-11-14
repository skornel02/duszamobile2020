import 'package:duszamobile2020/route/add_evignette_page.dart';
import 'package:duszamobile2020/route/auto_settings_page.dart';
import 'package:duszamobile2020/route/main_page.dart';
import 'package:duszamobile2020/route/add_car_page.dart';
import 'package:duszamobile2020/route/cars_page.dart';
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
    return Center(
        child: Text(
      "/settings",
    ));
  }), transitionType: TransitionType.material);
  router.define("/cars", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Center(
      child: CarsPage(),
    );
  }));
  router.define("/cars/add", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddCarPage();
  }));
  router.define("/cars/:id", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("settings");
  }));

  router.define("/cars/:car_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Center(
      child: Text("/cars/${params["car_id"]}"),
    );
  }));

  router.define("/cars/:car_id/statistics", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("statistics");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/settings", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarSettingsPage();
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/repairs", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("repairs");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/refuel", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("refuel");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/reminder", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("reminder");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/evignette", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainPage("evignette");
  }), transitionType: TransitionType.none);
  router.define("/cars/:car_id/evignette/add", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddEVignettePage();
  }), transitionType: TransitionType.none);


  // it is also possible to define the route transition to use
  // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
}
