import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatisticsPage extends StatelessWidget {
  final String id;

  StatisticsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created StatisticsPage");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarBloc(
          carId: id, repo: RepositoryProvider.of<CarRepository>(context)),
      child: Scaffold(
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state){
            if(state is ReadyState){
              return Column(
                children: [
                  // statistics widgets

                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
