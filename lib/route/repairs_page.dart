import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:duszamobile2020/widgets/listitems/repair_item.dart';

class RepairsPage extends StatelessWidget {
  RepairsPage({Key key}) : super(key: key) {
    debugPrint("Created RepairsPage");
  }

  void _onAdd(BuildContext context, Car car) {
    Navigator.pushNamed(context, "/cars/${car.id}/repairs/add");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        if (state is ReadyState) {
          final car = state.car;
          return Scaffold(
            body: Column(
              children: [
                Container(
                  height: 200,
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
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(FontAwesomeIcons.plus),
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
