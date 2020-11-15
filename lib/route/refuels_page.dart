import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:duszamobile2020/widgets/listitems/refuel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class RefuelsPage extends StatelessWidget {
  final String id;

  RefuelsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created RefuelsPage");
  }

  void _onAdd(BuildContext context) {
    Navigator.pushNamed(context, "/cars/$id/refuels/add");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).refuels_page_menuitem),
      ),
      drawer: SafeArea(
        child: carDrawer(context, id, selectedMenu: DrawerItem.REFUEL),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is ReadyState) {
            final car = state.car;
            if (car.refuels.isNotEmpty) {
              List<Refuel> chartRefuels = List.from(car.refuels);
              chartRefuels.sort((a, b) => a.date.compareTo(b.date));

              double averageEfficiency = 0;
              car.refuels.forEach((element) {
                averageEfficiency += element.efficieny;
              });
              averageEfficiency /= car.refuels.length;

              final chartData = [
                charts.Series<Refuel, DateTime>(
                  id: 'Efficiency',
                  colorFn: (Refuel refuel, __) {
                    switch (refuel.getConsumptionRating(averageEfficiency)) {
                      case ConsumptionRating.NORMAL:
                        return charts.ColorUtil.fromDartColor(Colors.blue);
                      case ConsumptionRating.BELLOW_AVERAGE:
                        return charts.ColorUtil.fromDartColor(Colors.green);
                      case ConsumptionRating.ABOVE_NORMAL:
                        return charts.ColorUtil.fromDartColor(Colors.orange);
                      case ConsumptionRating.HIGH:
                        return charts.ColorUtil.fromDartColor(
                            Colors.red.shade700);
                      default:
                        return charts.ColorUtil.fromDartColor(Colors.grey);
                    }
                  },
                  domainFn: (Refuel refuel, _) => refuel.date,
                  measureFn: (Refuel refuel, _) => refuel.efficieny,
                  fillColorFn: (Refuel refuel, _) {
                    switch (refuel.getConsumptionRating(averageEfficiency)) {
                      case ConsumptionRating.NORMAL:
                        return charts.ColorUtil.fromDartColor(Colors.blue);
                      case ConsumptionRating.BELLOW_AVERAGE:
                        return charts.ColorUtil.fromDartColor(Colors.green);
                      case ConsumptionRating.ABOVE_NORMAL:
                        return charts.ColorUtil.fromDartColor(Colors.orange);
                      case ConsumptionRating.HIGH:
                        return charts.ColorUtil.fromDartColor(
                            Colors.red.shade700);
                      default:
                        return charts.ColorUtil.fromDartColor(Colors.grey);
                    }
                  },
                  data: chartRefuels,
                )
              ];

              return Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: charts.TimeSeriesChart(
                      chartData,
                      animate: true,
                      domainAxis: charts.DateTimeAxisSpec(
                        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                          day: charts.TimeFormatterSpec(
                              format: 'd',
                              transitionFormat: S.of(context).date_format),
                        ),
                      ),
                    ),
                  ),
                  Center(child: Text(S.of(context).consumption_label)),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: car.refuels.length,
                      itemBuilder: (context, index) {
                        return RefuelItem(
                          car.refuels[index],
                          index: index,
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              //TODO: ERIK, JOBB FELIRAT!!!
              return Text("_____________");
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _onAdd(context),
      ),
    );
  }
}
