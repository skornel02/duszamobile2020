import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RemindersPage extends StatelessWidget {
  final String id;
  RemindersPage(this.id, {Key key}) : super(key: key) {
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
            appBar: AppBar(title: Text(S.of(context).reminders),),
            drawer: carDrawer(context, id),
            body: ListView.builder(
              itemCount: car.reminds.length,
              itemBuilder: (context, index) {
              return Text(car.reminds[index].name);
            }),
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
