import 'package:duszamobile2020/widgets/statistics.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class StatisticsPage extends StatefulWidget {
  final String id;

  StatisticsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created StatisticsPage");
  }
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String filterValue = "general_statistics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).statistics),
      ),
      drawer:
          carDrawer(context, widget.id, selectedMenu: DrawerItem.STATISTICS),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is ReadyState) {
            final car = state.car;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(S.of(context).filter + ":"),
                        ),
                        Builder(builder: (c) {
                          List<DropdownMenuItem> items = [
                            DropdownMenuItem(
                              child: Text(S.of(context).general_statistics),
                              value: "general_statistics",
                            ),
                          ];

                          state.car.knownTags.forEach((e) {
                            items.add(DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ));
                          });

                          return DropdownButton(
                              value: filterValue,
                              items: items,
                              onChanged: (v) {
                                setState(() {
                                  filterValue = v;
                                });
                              });
                        })
                      ],
                    ),
                  ),
                  Builder(builder: (context) {
                    if (filterValue == "general_statistics") {
                      return GlobalStatistics();
                    } else {
                      return ItemStatistics(
                        item: filterValue,
                      );
                    }
                  })
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
