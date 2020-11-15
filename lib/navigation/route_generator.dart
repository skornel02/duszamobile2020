import 'package:duszamobile2020/route/add_car_page.dart';
import 'package:duszamobile2020/route/add_evignette_page.dart';
import 'package:duszamobile2020/route/add_refuel_page.dart';
import 'package:duszamobile2020/route/add_reminder_page.dart';
import 'package:duszamobile2020/route/add_repair_page.dart';
import 'package:duszamobile2020/route/car_settings_page.dart';
import 'package:duszamobile2020/route/car_page.dart';
import 'package:duszamobile2020/route/cars_page.dart';
import 'package:duszamobile2020/route/edit_evignette_page.dart';
import 'package:duszamobile2020/route/edit_refuel_page.dart';
import 'package:duszamobile2020/route/edit_reminder.dart';
import 'package:duszamobile2020/route/edit_repair_page.dart';
import 'package:duszamobile2020/route/evignettes_page.dart';
import 'package:duszamobile2020/route/refuels_page.dart';
import 'package:duszamobile2020/route/reminder_page.dart';
import 'package:duszamobile2020/route/repairs_page.dart';
import 'package:duszamobile2020/route/settings_page.dart';
import 'package:duszamobile2020/route/statistics_page.dart';
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

Widget handleAddRefuelRoute(BuildContext context, Map<String, dynamic> params) {
  String carId = params["car_id"][0];
  return WithCarBloc(
    carId: carId,
    onCarNotFound: carNotFoundEvent,
    child: AddRefuelPage(carId),
  );
}

Widget handleStatisticsRoute(
    BuildContext context, Map<String, dynamic> params) {
  String carId = params["car_id"][0];
  return WithCarBloc(
    carId: carId,
    onCarNotFound: carNotFoundEvent,
    child: StatisticsPage(carId),
  );
}

Widget handleRepairRoute(BuildContext context, Map<String, dynamic> params) {
  String carId = params["car_id"][0];
  return WithCarBloc(
    carId: carId,
    onCarNotFound: carNotFoundEvent,
    child: RepairsPage(carId),
  );
}

Widget handleEVignetteRoute(BuildContext context, Map<String, dynamic> params) {
  String carId = params["car_id"][0];
  return WithCarBloc(
    carId: carId,
    onCarNotFound: carNotFoundEvent,
    child: EVignettesPage(carId),
  );
}

Widget handleRemindersRoute(BuildContext context, Map<String, dynamic> params) {
  String carId = params["car_id"][0];
  return WithCarBloc(
    carId: carId,
    onCarNotFound: carNotFoundEvent,
    child: RemindersPage(carId),
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

  router.define("/cars/:car_id",
      handler: Handler(handlerFunc: handleStatisticsRoute),
      transitionType: TransitionType.material);

  router.define("/cars/:car_id/statistics",
      handler: Handler(handlerFunc: handleStatisticsRoute),
      transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/settings", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    debugPrint(params["car_id"][0]);
    return CarSettingsPage(params["car_id"][0]);
  }), transitionType: TransitionType.material);

  router.define("/cars/:car_id/repairs",
      handler: Handler(handlerFunc: handleRepairRoute),
      transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/repairs/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddRepairPage(params["car_id"][0]);
  }), transitionType: TransitionType.material);

  router.define("/cars/:car_id/repairs/:repair_id", handler:
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EditRepairPage(params["car_id"][0], params["repair_id"][0]);
  }), transitionType: TransitionType.material);

  router.define(
    "/cars/:car_id/refuels",
    handler: Handler(handlerFunc: handleRefuelRoute),
    transitionType: TransitionType.fadeIn,
  );

  router.define(
    "/cars/:car_id/refuels/add",
    handler: Handler(handlerFunc: handleAddRefuelRoute),
    transitionType: TransitionType.material,
  );

  router.define("/cars/:car_id/refuels/:refuel_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EditRefuelPage(params["car_id"][0], params["refuel_id"][0]);
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/reminders",
      handler: Handler(handlerFunc: handleRemindersRoute),
      transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/reminders/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddReminderPage(params["car_id"][0]);
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/reminders/:reminder_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EditReminderPage(params["car_id"][0], params["reminder_id"][0]);
  }), transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/evignettes",
      handler: Handler(handlerFunc: handleEVignetteRoute),
      transitionType: TransitionType.fadeIn);

  router.define("/cars/:car_id/evignettes/add", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return AddEVignettePage(params["car_id"][0]);
  }), transitionType: TransitionType.material);

  router.define("/cars/:car_id/evignettes/:evignette_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EditEVignettePage(params["car_id"][0], params["evignette_id"][0]);
  }), transitionType: TransitionType.material);
}
