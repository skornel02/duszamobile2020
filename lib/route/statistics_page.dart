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
  _StatisticsPageState createState()=> _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {

  String filterValue = "general_statistics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).statistics),
      ),
      drawer: carDrawer(context, widget.id, selectedMenu: DrawerItem.STATISTICS),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is ReadyState) {
            final car = state.car;
            final repairs = S.of(context).repairs;
            final refuels = S.of(context).refuels;
            final formatter = DateFormat(S.of(context).date_format);

            Map<String, double> moneySpent = new Map();
            car.repairs.forEach((repair) {
              moneySpent.putIfAbsent(repairs, () => 0);
              moneySpent[repairs] = moneySpent[repairs] + repair.price;
            });
            car.refuels.forEach((refuel) {
              moneySpent.putIfAbsent(refuels, () => 0);
              moneySpent[refuels] = moneySpent[refuels] + refuel.paid;
            });

            final totalSpendingData = [
              charts.Series<MapEntry<String, double>, String>(
                id: 'Spent on stuff',
                domainFn: (MapEntry<String, double> spending, _) =>
                spending.key,
                measureFn: (MapEntry<String, double> spending, _) =>
                spending.value,
                data: moneySpent.entries.toList(),
                labelAccessorFn: (MapEntry<String, double> spending, _) => S
                    .of(context)
                    .spending_format(
                    spending.key, spending.value.toStringAsFixed(0)),
              )
            ];

            Map<String, double> petrolPrice = new Map();
            car.refuels.forEach((refuel) {
              if (refuel.date
                  .isBefore(DateTime.now().add(Duration(days: -180)))) return;
              petrolPrice[formatter.format(refuel.date)] = refuel.pricePerLiter;
            });

            final petrolPriceData = [
              charts.Series<MapEntry<String, double>, String>(
                id: 'Petrol price over time',
                domainFn: (MapEntry<String, double> spending, _) =>
                spending.key,
                measureFn: (MapEntry<String, double> spending, _) =>
                spending.value,
                data: petrolPrice.entries.toList(),
              )
            ];

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
                        Builder(builder: (c){

                          List<DropdownMenuItem> items = [
                            DropdownMenuItem(

                              child: Text(S.of(context).general_statistics),
                              value: "general_statistics",
                            ),
                          ];


                          state.car.knownTags.forEach((e) {
                            items.add(DropdownMenuItem(child: Text(e)));
                          });

                          return DropdownButton(
                              value: filterValue,
                              items: items,
                              onChanged: (v){
                                setState(() {
                                  filterValue = v;
                                });
                              }
                          );
                        })
                      ],
                    ),
                  ),

                  Center(
                    child: Text(
                      S.of(context).total_spending,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: charts.PieChart(
                      totalSpendingData,
                      animate: true,
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside)
                          ]),
                    ),
                  ),
                  Center(
                    child: Text(
                      S.of(context).petrol_price_over_time,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: charts.BarChart(
                      petrolPriceData,
                      animate: true,
                    ),
                  ),
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