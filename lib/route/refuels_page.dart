import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/widgets/listitems/refuel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefuelsPage extends StatelessWidget {
  final String id;

  RefuelsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created RefuelsPage");
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

                  Expanded(
                    child: ListView.builder(
                      itemCount: state.car.refuels.length,
                      itemBuilder: (context, index) {
                        return RefuelItem(state.car.refuels[index]);
                    }),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
      onPressed: () {
        debugPrint("asfuioajiov: " + id);
        Navigator.pushNamed(context, "/cars/$id/refuels/add");
      },
    ),
      ),
    );
  }
}
