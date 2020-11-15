import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
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
        appBar: AppBar(
          title: Text(S.of(context).evignettes),
        ),
        drawer: carDrawer(context, id),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is ReadyState) {
              final car = state.car;
              return ListView.builder(
                itemCount: state.car.eVignettes.length,
                itemBuilder: (context, index) {
                  return Text(car.eVignettes[index].area);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            Navigator.pushNamed(context, "/cars/$id/evignettes/add");
          },
        ),
      ),
    );
  }
}
