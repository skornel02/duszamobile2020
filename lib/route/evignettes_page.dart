import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EVignettesPage extends StatelessWidget {
  EVignettesPage({Key key}) : super(key: key) {
    debugPrint("Created EVignettesPage");
  }

  void _onAdd(BuildContext context, Car car) {
    Navigator.pushNamed(context, "/cars/${car.id}/evignettes/add");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        if (state is ReadyState) {
          final car = state.car;
          return Scaffold(
            body: Center(
              child: TextField(),
            ),
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
