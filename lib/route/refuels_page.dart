import 'dart:math';

import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/widgets/listitems/refuel_item.dart';
import 'package:flutter/material.dart';

class RefuelsPage extends StatelessWidget {
  RefuelsPage({Key key}) : super(key: key) {
    debugPrint("Created RefuelsPage");
  }

  @override
  Widget build(BuildContext context) {
    List<Refuel> refuels = [
      Refuel.create(
          id: "null",
          date: DateTime.now(),
          refueled: 12121,
          paid: 13212412,
          lastMilage: 4141,
          milage: 1414),
      Refuel.create(
          id: "null",
          date: DateTime.now(),
          refueled: 12121,
          paid: 13212412,
          lastMilage: 4141,
          milage: 1414),
      Refuel.create(
          id: "null",
          date: DateTime.now(),
          refueled: 12121,
          paid: 13212412,
          lastMilage: 4141,
          milage: 1414),
      Refuel.create(
          id: "null",
          date: DateTime.now(),
          refueled: 12121,
          paid: 13212412,
          lastMilage: 4141,
          milage: 1414)
    ];

    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return RefuelItem(refuels[index]);
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/cars/add");
        },
      ),
    );
  }
}
