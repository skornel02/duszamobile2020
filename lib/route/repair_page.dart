import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/widgets/listitems/repair_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepairPage extends StatelessWidget {
  RepairPage({Key key}) : super(key: key) {
    debugPrint("Created RepairPage");
  }

  void _onAdd(BuildContext context, Car car) {
    Navigator.pushNamed(context, "/cars/${car.id}/repair/add");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state){
        if(state is ReadyState){
          return Scaffold(
            body: ListView.builder(
              itemCount: state.car.refuels.length,
              itemBuilder: (context, index) {
                return RepairItem(state.car.repairs[index]);
              },
            ),

            floatingActionButton: FloatingActionButton(
              child: Icon(FontAwesomeIcons.plus),
              onPressed: () => _onAdd(context, state.car),
            ),
          );
        }if (state is CarNotFoundState){
          Navigator.pushNamedAndRemoveUntil(context, "/cars", (route) => false);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
