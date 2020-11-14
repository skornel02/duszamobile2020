import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:duszamobile2020/widgets/car_form.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<ScaffoldState> _profileScaffoldKey = new GlobalKey<ScaffoldState>();

class AddCarPage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			key: _profileScaffoldKey,
			appBar: AppBar(
				title: Text(S.of(context).add_car),
			),
			body: CarForm(callback: (Car car) async {
				debugPrint("CALLBACK");
				final repository =
				RepositoryProvider.of<CarRepository>(context);
				await repository.updateCar(car);
				Navigator.pushNamedAndRemoveUntil(
						context, "/cars/" + car.id, (a) => false);
			},),
		);
	}
}