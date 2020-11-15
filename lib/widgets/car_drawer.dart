import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget carDrawer(BuildContext context, String carId) {
  return SizedBox( width: 250,
    child: SafeArea(
      child: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(FontAwesomeIcons.gasPump),
              title: Text(S.of(context).refuels_page_menuitem),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/cars/$carId/refuels", (a) => false);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.screwdriver),
              title: Text(S.of(context).repairs_page_menuitem),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/cars/$carId/repairs", (a) => false);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.clock),
              title: Text(S.of(context).reminders_page_menuitem),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/cars/$carId/reminders", (a) => false);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.stickyNote),
              title: Text(S.of(context).e_vignette_page_menuitem),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/cars/$carId/evignettes", (a) => false);
              },
            ),
            ListTile(
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
        ),
      ),
    ),
  );
}
