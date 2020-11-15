import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/route/reminder_page.dart';
import 'package:duszamobile2020/route/repairs_page.dart';
import 'package:duszamobile2020/route/statistics_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'evignettes_page.dart';

class CarPage extends StatelessWidget {
  final String path;
  final String id;
  CarPage({@required this.id, this.path}) {
    debugPrint("Created Mainpage");
  }

  String getCurrentPageTitle(context) {
    switch (path) {
      case "statistics":
        return S.of(context).statistics + ": ";
      case "repairs":
        return S.of(context).repairs + ": ";
      case "refuels":
        return S.of(context).refuels + ": ";
      case "reminders":
        return S.of(context).reminders + ": ";
      case "evignettes":
        return S.of(context).evignettes + ": ";
    }
    return "";
  }

  Drawer drawer(context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: Icon(FontAwesomeIcons.gasPump),
            title: Text("tankolás"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, "/cars/$id/refuels", (a) => false);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.gasPump),
            title: Text("Szervizek"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, "/cars/$id/repairs", (a) => false);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.gasPump),
            title: Text("Értesitők"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, "/cars/$id/reminders", (a) => false);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.gasPump),
            title: Text("Autópálya matricák"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, "/cars/$id/evignettes", (a) => false);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.gasPump),
            title: Text("Statisztikák"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, "/cars/$id/statistics", (a) => false);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.gasPump),
            title: Text("Felhasználói beállitás"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/settings");
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.gasPump),
            title: Text("Autó beállítások"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/cars/$id/settings");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CarBloc(
            carId: id, repo: RepositoryProvider.of<CarRepository>(context)),
        child: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is ReadyState) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(getCurrentPageTitle(context) + state.car.name),
                ),
                drawer: SafeArea(
                  child: drawer(context),
                ),
                body: Builder(
                  builder: (c) {
                    debugPrint("asdsadsad: " + path);
                    switch (path) {
                      case "statistics":
                        return StatisticsPage();
                      case "repairs":
                        return RepairsPage();
                      case "refuels":
                        return RepairsPage(); //RefuelsPage();
                      case "reminders":
                        return RemindersPage();
                      case "evignettes":
                        return EVignettesPage();
                    }
                    return null;
                  },
                ),
              );
            }
            if (state is CarNotFoundState) {
              Navigator.pushNamedAndRemoveUntil(context, "/cars", (_) => false);
            }
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
