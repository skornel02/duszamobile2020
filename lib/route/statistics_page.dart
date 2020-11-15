import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            appBar: AppBar(
              title: Text(S.of(context).statistics),
            ),
            drawer: carDrawer(context, id, selectedMenu: DrawerItem.STATISTICS),
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
