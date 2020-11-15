import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithCarBloc extends StatelessWidget {
  final String carId;
  final Function onCarNotFound;
  final Widget child;

  WithCarBloc({this.carId, this.onCarNotFound, this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarBloc(
          carId: carId, repo: RepositoryProvider.of<CarRepository>(context)),
      child: BlocListener<CarBloc, CarState>(
        listener: (context, state) {
          if (state is CarNotFound) {
            onCarNotFound(context);
          }
        },
        child: child,
      ),
    );
  }
}
