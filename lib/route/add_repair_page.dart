import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/resources/repair.dart';
import 'package:duszamobile2020/widgets/forms/repair_form.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<ScaffoldState> _profileScaffoldKey = new GlobalKey<ScaffoldState>();

class AddRepairPage extends StatelessWidget {
  final String carId;
  AddRepairPage(this.carId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarBloc(
          carId: carId, repo: RepositoryProvider.of<CarRepository>(context)),
      child: Scaffold(
          key: _profileScaffoldKey,
          appBar: AppBar(
            title: Text(S.of(context).add_repair),
          ),
          body: BlocBuilder<CarBloc, CarState>(
            builder: (context, state) {
              debugPrint("Current state of carbloc: " + state.toString());
              if (state is ReadyState) {
                final car = state.car;
                return RepairForm(
                  milage: car.totalMilage,
                  suggestions: car.knownTags,
                  callback: (Repair repair) async {
                    BlocProvider.of<CarBloc>(context)
                        .add(SaveRepairItem(repair));
                    Navigator.pop(context);
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
