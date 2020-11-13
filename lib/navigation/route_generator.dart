import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:duszamobile2020/generated/l10n.dart';

Handler usersHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return null; //UsersScreen(params["id"][0]);
});

Handler mainPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Center(
    child: Text(S.of(context).main_page),
  );
});

void defineRoutes(FluroRouter router) {
  router.define("/", handler: mainPageHandler);
  router.define("/users/:id", handler: usersHandler);

  // it is also possible to define the route transition to use
  // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
}
