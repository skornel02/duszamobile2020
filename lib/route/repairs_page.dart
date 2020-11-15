import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:duszamobile2020/widgets/listitems/repair_item.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RepairsPage extends StatelessWidget {
  final String id;

  RepairsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created RepairsPage");
  }

  void _onAdd(BuildContext context) {
    Navigator.pushNamed(context, "/cars/$id/repairs/add");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).repairs),
      ),
      drawer: carDrawer(context, id, selectedMenu: DrawerItem.REPAIR),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is ReadyState) {
            final car = state.car;

            Map<String, int> itemFrequency = new Map();
            car.repairs.forEach((repair) {
              repair.items.forEach((item) {
                itemFrequency.putIfAbsent(item, () => 0);
                itemFrequency[item] = itemFrequency[item] + 1;
              });
            });

            final chartData = [
              charts.Series<MapEntry<String, int>, String>(
                id: "Item frequency",
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (MapEntry<String, int> entry, _) => entry.key,
                measureFn: (MapEntry<String, int> entry, _) => entry.value,
                data: itemFrequency.entries.toList(),
              )
            ];

            return Column(
              children: [
                Container(
                  height: 200,
                  child: charts.BarChart(
                    chartData,
                    animate: true,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: car.repairs.length,
                    itemBuilder: (context, index) {
                      return RepairItem(car.repairs[index]);
                    },
                  ),
                )
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () => _onAdd(context),
      ),
    );
  }
}
