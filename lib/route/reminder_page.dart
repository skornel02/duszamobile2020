import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemindersPage extends StatelessWidget {
  RemindersPage({Key key}) : super(key: key) {
    debugPrint("Created RemindersPage");
  }

  void _onAdd(BuildContext context, Car car) {
    Navigator.pushNamed(context, "/cars/${car.id}/reminders/add");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        if (state is ReadyState) {
          final car = state.car;
          return Scaffold(
            body: ListView.builder(itemBuilder: (context, index) {}),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _onAdd(context, car),
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
