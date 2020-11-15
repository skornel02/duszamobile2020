import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:duszamobile2020/widgets/forms/reminder_form.dart';
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<ScaffoldState> _profileScaffoldKey = new GlobalKey<ScaffoldState>();

class AddReminderPage extends StatelessWidget {
	final String carId;
	AddReminderPage(this.carId);

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (_) => CarBloc(
					carId: carId, repo: RepositoryProvider.of<CarRepository>(context)),
			child: Scaffold(
					key: _profileScaffoldKey,
					appBar: AppBar(
						title: Text(S.of(context).add_reminder),
					),
					body: BlocBuilder<CarBloc, CarState>(
						builder: (context, state){
							debugPrint("Current state of carbloc: " + state.toString());
							if(state is ReadyState){
								return ReminderForm(
									callback: (Reminder reminder) async {
										BlocProvider.of<CarBloc>(context).add(SaveReminderItem(reminder));
										Navigator.pop(context);
									},
								);
							}
							return Center(child: CircularProgressIndicator(),);
						},
					)
			),
		);
	}
}