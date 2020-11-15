import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EVignettesPage extends StatelessWidget {
  final String id;
  EVignettesPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created EVignettesPage");
  }

  void _onAdd(BuildContext context, Car car) {
    Navigator.pushNamed(context, "/cars/${car.id}/evignettes/add");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarBloc(
          carId: id, repo: RepositoryProvider.of<CarRepository>(context)),
      child: Scaffold(
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is ReadyState) {
              return Column(
                children: [
                  // statistics widgets
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/cars/add");
          },
        ),
      ),
    );
  }
}
