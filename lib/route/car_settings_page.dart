import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/widgets/car_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<ScaffoldState> _profileScaffoldKey = new GlobalKey<ScaffoldState>();

class CarSettingsPage extends StatelessWidget {
  final String id;

  CarSettingsPage(this.id, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarBloc(
          carId: id, repo: RepositoryProvider.of<CarRepository>(context)),
      child: Scaffold(
        key: _profileScaffoldKey,
        appBar: AppBar(
          title: Text(S.of(context).car_settings),
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (contex, state) {
            debugPrint("kbnod: " + state.toString());
            if (state is ReadyState) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: CarForm(
                  car: state.car,
                  callback: (Car car) async {
                    final repository =
                        RepositoryProvider.of<CarRepository>(context);
                    await repository.updateCar(car);
                    await setSelectedCar(car.id);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/cars/" + car.id, (a) => false);
                  },
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
