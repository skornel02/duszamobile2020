import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/e_vignette.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:duszamobile2020/widgets/listitems/evignette_item.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).evignettes),),
      ),
      drawer: carDrawer(context, id, selectedMenu: DrawerItem.E_VIGNETTE),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is ReadyState) {
            final car = state.car;

            List<EVignette> active = List();
            List<EVignette> expired = List();

            car.eVignettes.forEach((eVignette) {
              if (eVignette.isActive(DateTime.now())) {
                active.add(eVignette);
              } else {
                expired.add(eVignette);
              }
            });

            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      S.of(context).active,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: active.length,
                    itemBuilder: (context, index) {
                      return EVignetteItem(active[index]);
                    },
                  ),
                  Divider(),
                  Center(
                    child: Text(
                      S.of(context).expired,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: expired.length,
                    itemBuilder: (context, index) {
                      return EVignetteItem(expired[index]);
                    },
                  ),
                ],
              ),
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
    );
  }
}
