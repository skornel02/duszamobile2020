import 'package:duszamobile2020/blocs/cars_bloc/cars_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/widgets/listitems/car_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:duszamobile2020/generated/l10n.dart';

class CarsPage extends StatelessWidget {
  CarsPage({Key key}) : super(key: key) {
    debugPrint("Created CarsPage");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarsBloc(RepositoryProvider.of<CarRepository>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).my_cars),
          actions: [
            IconButton(
                icon: Icon(FontAwesomeIcons.cog),
                onPressed: () {
                  Navigator.pushNamed(context, "/settings");
                })
          ],
        ),
        body: new BlocBuilder<CarsBloc, CarsState>(
          builder: (context, state) {
            if (state is ReadyState) {
              return RefreshIndicator(
                  child: Center(
                    child: ListView.builder(
                      itemCount: state.cars.length,
                      itemBuilder: (context, index) =>
                          CarItem(car: state.cars[index]),
                    ),
                  ),
                  onRefresh: () {
                    BlocProvider.of<CarsBloc>(context).add(RefreshCars());
                    return Future.delayed(Duration(seconds: 1));
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            Navigator.pushNamed(context, "/cars/add");
          },
        ),
      ),
    );
  }
}
