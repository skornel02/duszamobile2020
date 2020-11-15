import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
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
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        if (state is ReadyState) {
          // TODO: Car statistics
          return Scaffold(
            body: Column(
              children: [],
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
