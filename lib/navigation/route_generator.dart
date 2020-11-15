import 'package:duszamobile2020/route/add_car_page.dart';
import 'package:duszamobile2020/route/add_evignette_page.dart';
import 'package:duszamobile2020/route/add_refuel_page.dart';
import 'package:duszamobile2020/route/car_settings_page.dart';
import 'package:duszamobile2020/route/car_page.dart';
import 'package:duszamobile2020/route/cars_page.dart';
import 'package:duszamobile2020/route/edit_refuel_page.dart';
import 'package:duszamobile2020/route/refuels_page.dart';
import 'package:duszamobile2020/route/settings_page.dart';
import 'package:duszamobile2020/widgets/car_bloc_widget.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void carNotFoundEvent(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, "/cars", (_) => false);
}

Widget handleRefuelRoute(BuildContext context, Map<String, dynamic> params) {
  String carId = params["car_id"][0];
  return WithCarBloc(
    carId: carId,
    onCarNotFound: carNotFoundEvent,
    child: RefuelsPage(carId),
  );
}

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
  }), transitionType: TransitionType.material);

  router.define("/cars/:car_id/statistics", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "statistics");
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/settings", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    debugPrint(params["car_id"][0]);
    return CarSettingsPage(params["car_id"][0]);
  }), transitionType: TransitionType.material);

  router.define("/cars/:car_id/repairs", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "repairs");
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/repairs/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddRefuelPage(params["car_id"][0]);
  }), transitionType: TransitionType.material);

  router.define(
    "/cars/:car_id/refuels",
    handler: Handler(handlerFunc: handleRefuelRoute),
    transitionType: TransitionType.fadeIn,
  );

  router.define("/cars/:car_id/refuels/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "refuels/add");
  }), transitionType: TransitionType.material);

  router.define("/cars/:car_id/refuels/:refuel_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EditRefuelPage(params["car_id"][0], params["refuel_id"][0]);
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/reminders", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "reminders");
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/evignettes", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CarPage(id: params["car_id"][0], path: "evignettes");
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/evignettes/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddEVignettePage();
  }), transitionType: TransitionType.material);
}
