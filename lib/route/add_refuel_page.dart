import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/widgets/forms/refuel_form.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<ScaffoldState> _profileScaffoldKey = new GlobalKey<ScaffoldState>();

class AddRefuelPage extends StatelessWidget {
  final String carId;
  AddRefuelPage(this.carId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _profileScaffoldKey,
      appBar: AppBar(
        title: Text(S.of(context).add_refuel),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          debugPrint("Current state of carbloc: " + state.toString());
          if (state is ReadyState) {
            final car = state.car;
            return RefuelForm(
              callback: (Refuel refuel) async {
                BlocProvider.of<CarBloc>(context).add(SaveRefuelItem(refuel));
                Navigator.pop(context);
              },
              refuels: car.refuels,
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
