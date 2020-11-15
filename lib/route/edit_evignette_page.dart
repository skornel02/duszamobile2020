import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/e_vignette.dart';
import 'package:duszamobile2020/widgets/forms/evignette_form.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<ScaffoldState> _profileScaffoldKey = new GlobalKey<ScaffoldState>();

class EditEVignettePage extends StatelessWidget {
  final String carId;
  final String eVignetteId;
  EditEVignettePage(this.carId, this.eVignetteId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _profileScaffoldKey,
      appBar: AppBar(
        title: Text(S.of(context).add_evignette),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          debugPrint("Current state of carbloc: " + state.toString());
          if (state is ReadyState) {
            return EVignetteForm(
              eVignette: state.car.getEVignetteById(eVignetteId),
              callback: (EVignette eVignette) async {
                BlocProvider.of<CarBloc>(context)
                    .add(SaveEVignetteItem(eVignette));
                Navigator.pop(context);
              },
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
