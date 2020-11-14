import 'package:duszamobile2020/route/test_route.dart';
import 'file:///E:/Projects/duszamobile20201/lib/route/add_car_page.dart';
import 'file:///E:/Projects/duszamobile20201/lib/route/cars_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void defineRoutes(FluroRouter router) {
  router.define("/test", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return TestRoute();
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
    return Center(
      child: AddCarPage(),
    );
  }));
  router.define("/cars/:car_id", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Center(
      child: Text("/cars/${params["car_id"]}"),
    );
  }));
  router.define("/cars/:car_id/statistics", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Center(
      child: Text("/cars/${params["car_id"]}/statistics"),
    );
  }));

  // it is also possible to define the route transition to use
  // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
}
