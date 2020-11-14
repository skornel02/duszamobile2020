import 'package:duszamobile2020/widgets/car_create_form.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';

GlobalKey<ScaffoldState> _profileScaffoldKey = new GlobalKey<ScaffoldState>();

class AddCarPage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			key: _profileScaffoldKey,
			appBar: AppBar(
				title: Text(S.of(context).add_car),
			),
			body: Padding(
				padding: const EdgeInsets.all(16),
				child: CarCreateForm(),
			),
		);
	}
}