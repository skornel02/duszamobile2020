import 'package:duszamobile2020/widgets/pages/add_car_page.dart';
import 'package:duszamobile2020/widgets/pages/cars_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:duszamobile2020/localizations.dart';

Handler usersHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
	return null;//UsersScreen(params["id"][0]);
});

Handler mainPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
	return Center(child: Text("main_page".loc(context)),);
});

void defineRoutes(FluroRouter router) {
	router.define("/settings", handler: Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
			return Center(child: Text("/settings",));
	}), transitionType: TransitionType.material);
	router.define("/cars", handler: Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
		return Center(child: CarsPage(),);
	}));
	router.define("/cars/add", handler: Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
		return Center(child: AddCarPage(),);
	}));
	router.define("/cars/:car_id", handler: Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
		return Center(child: Text("/cars/${params["car_id"]}"),);
	}));
	router.define("/cars/:car_id/statistics", handler: Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
		return Center(child: Text("/cars/${params["car_id"]}/statistics"),);
	}));



	// it is also possible to define the route transition to use
	// router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
}