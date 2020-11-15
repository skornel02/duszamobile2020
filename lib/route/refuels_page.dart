import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:duszamobile2020/widgets/listitems/refuel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefuelsPage extends StatelessWidget {
  final String id;

  RefuelsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created RefuelsPage");
  }

  void _onAdd(BuildContext context) {
    Navigator.pushNamed(context, "/cars/$id/refuels/add");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).refuels_page_menuitem),
      ),
      drawer: SafeArea(
        child: carDrawer(context, id, selectedMenu: DrawerItem.REFUEL),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is ReadyState) {
            final car = state.car;
            return ListView.builder(
              itemCount: car.refuels.length,
              itemBuilder: (context, index) {
                return RefuelItem(car.refuels[index]);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _onAdd(context),
      ),
    );
  }
}
