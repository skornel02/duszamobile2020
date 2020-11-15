import 'dart:math';

import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/widgets/listitems/refuel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefuelsPage extends StatelessWidget {
  final String id;

  RefuelsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created RefuelsPage");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        if (state is ReadyState) {
          final car = state.car;
          return Scaffold(
            body: ListView.builder(
              itemCount: car.refuels.length,
              itemBuilder: (context, index) {
                return RefuelItem(car.refuels[index]);
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/cars/add");
              },
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
