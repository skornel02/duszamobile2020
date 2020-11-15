import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:duszamobile2020/resources/repair.dart';
import 'package:duszamobile2020/widgets/listitems/reminder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'listitems/repair_item.dart';

class GlobalStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(builder: (context, state) {
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
            domainFn: (MapEntry<String, double> spending, _) => spending.key,
            measureFn: (MapEntry<String, double> spending, _) => spending.value,
            data: moneySpent.entries.toList(),
            labelAccessorFn: (MapEntry<String, double> spending, _) => S
                .of(context)
                .spending_format(
                    spending.key, spending.value.toStringAsFixed(0)),
          )
        ];

        Map<String, double> petrolPrice = new Map();
        car.refuels.forEach((refuel) {
          if (refuel.date.isBefore(DateTime.now().add(Duration(days: -180))))
            return;
          petrolPrice[formatter.format(refuel.date)] = refuel.pricePerLiter;
        });

        final petrolPriceData = [
          charts.Series<MapEntry<String, double>, String>(
            id: 'Petrol price over time',
            domainFn: (MapEntry<String, double> spending, _) => spending.key,
            measureFn: (MapEntry<String, double> spending, _) => spending.value,
            data: petrolPrice.entries.toList(),
          )
        ];

        return Column(
          children: [
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
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class ItemStatistics extends StatelessWidget {
  final String item;

  const ItemStatistics({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(builder: (context, state) {
      if (state is ReadyState) {
        final car = state.car;
        List<Repair> repairs = List();
        List<Reminder> reminders = List();

        print("ITEM: $item");

        car.repairs.forEach((repair) {
          if (repair.items.any((item) => item == this.item)) {
            repairs.add(repair);
          }
        });

        car.reminds.forEach((reminder) {
          if (reminder.items.any((item) => item == this.item)) {
            reminders.add(reminder);
          }
        });

        return Column(
          children: [
            Center(
              child: Text(
                S.of(context).repairs,
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: repairs.length,
              itemBuilder: (context, index) {
                return RepairItem(repairs[index]);
              },
            ),
            Center(
              child: Text(
                S.of(context).reminders,
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return ReminderItem(
                  reminders[index],
                  ReminderItemType.EXPIRED,
                  index: index,
                );
              },
            ),
          ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
