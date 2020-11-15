import 'dart:convert';
import 'dart:typed_data';

import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum DrawerItem {
  REFUEL,
  REPAIR,
  REMINDER,
  E_VIGNETTE,
  STATISTICS,
}

Widget carDrawer(BuildContext context, String carId,
    {DrawerItem selectedMenu}) {
  return SafeArea(
    child: Drawer(
        child: Column(
      children: [
        BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            String carName = "LOADING";
            Uint8List imageBytes;
            if (state is ReadyState) {
              final car = state.car;
              carName = car.name;
              if (car.settings.image != null)
                imageBytes = base64.decode(car.settings.image);
            }
            return DrawerHeader(
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.arrowLeft),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(carName, style: TextStyle(fontSize: 18)),
                      Container(),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 150, minHeight: 10),
                    child: imageBytes != null
                        ? Image.memory(imageBytes)
                        : Container(
                            height: 2,
                          ),
                  ),
                ],
              ),
            );
          },
        ),
        ListTile(
          selected: selectedMenu == DrawerItem.REFUEL,
          leading: Icon(FontAwesomeIcons.gasPump),
          title: Text(S.of(context).refuels_page_menuitem),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, "/cars/$carId/refuels", (a) => false);
          },
        ),
        ListTile(
          selected: selectedMenu == DrawerItem.REPAIR,
          leading: Icon(FontAwesomeIcons.screwdriver),
          title: Text(S.of(context).repairs_page_menuitem),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, "/cars/$carId/repairs", (a) => false);
          },
        ),
        ListTile(
          selected: selectedMenu == DrawerItem.REMINDER,
          leading: Icon(FontAwesomeIcons.clock),
          title: Text(S.of(context).reminders_page_menuitem),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, "/cars/$carId/reminders", (a) => false);
          },
        ),
        ListTile(
          selected: selectedMenu == DrawerItem.E_VIGNETTE,
          leading: Icon(FontAwesomeIcons.stickyNote),
          title: Text(S.of(context).e_vignette_page_menuitem),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, "/cars/$carId/evignettes", (a) => false);
          },
        ),
        ListTile(
          selected: selectedMenu == DrawerItem.STATISTICS,
          leading: Icon(FontAwesomeIcons.chartPie),
          title: Text(S.of(context).statistics_page_menuitem),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, "/cars/$carId/statistics", (a) => false);
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.car),
          title: Text(S.of(context).car_settings_page_menuitem),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/cars/$carId/settings");
          },
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.userCog),
          title: Text(S.of(context).user_settings_page_menuitem),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/settings");
          },
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.angleDoubleLeft,
            color: Colors.red,
          ),
          title: Text(S.of(context).back_to_cars_menuitem),
          onTap: () async {
            Navigator.pop(context);
            await clearSelectedCar();
            Navigator.pushNamedAndRemoveUntil(context, "/cars", (a) => false);
          },
        ),
      ],
    )),
  );
}
