import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RefuelItem extends StatelessWidget {
  final Refuel refuel;

  RefuelItem(this.refuel);

  void _onOpen(BuildContext context) {
    ReadyState state = BlocProvider.of<CarBloc>(context).state;
    print("Opening refuel #${refuel.id}");
    Navigator.pushNamed(context, "/cars/${state.car.id}/refuels/${refuel.id}");
  }

  void _onRemove(BuildContext context) {
    showConfirmAlert(
      context,
      title: S.of(context).are_you_sure,
      description: S.of(context).do_you_want_to(S.of(context).do_remove_refuel(
          DateFormat(S.of(context).date_format).format(refuel.date))),
      onAccept: () {
        BlocProvider.of<CarBloc>(context).add(RemoveRefuelItem(refuel.id));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: InkWell(
        onTap: () => _onOpen(context),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          runSpacing: 1.4,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 2,
                          children: [] //tagWidgets
                          ),
                    ),
                  ],
                ),
                Text(refuel.milage.toString() + " km"),
                Text("${S.of(context).currency(refuel.paid.toStringAsFixed(2))}"),

              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(DateFormat(S.of(context).date_format_to_show).format(refuel.date)),
            )
          ],
        ),
      ),
    );
  }
}
