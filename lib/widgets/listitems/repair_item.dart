import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/repair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:intl/intl.dart';

class RepairItem extends StatelessWidget {
  final Repair repair;

  RepairItem(this.repair);

  void _onOpen(BuildContext context) {
    ReadyState state = BlocProvider.of<CarBloc>(context).state;
    print("Opening repair #${repair.id}");
    Navigator.pushNamed(context, "/cars/${state.car.id}/repairs/${repair.id}");
  }

  void _onRemove(BuildContext context) {
    showConfirmAlert(
      context,
      title: S.of(context).are_you_sure,
      description: S.of(context).do_you_want_to(S.of(context).do_remove_repair(
          DateFormat(S.of(context).date_format).format(repair.date))),
      onAccept: () {
        BlocProvider.of<CarBloc>(context).add(RemoveRepairItem(repair.id));
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
                      child: Tags(
                          itemCount: repair.items.length,
                          itemBuilder: (int index) {
                            final item = repair.items[index];
                            return ItemTags(
                              key: Key(index.toString()),
                              index: index,
                              title: item,
                              active: true,
                              textStyle: TextStyle(
                                fontSize: 16,
                              ),
                              onPressed: (item) => print(item),
                              onLongPressed: (item) => print(item),
                            );
                          }),
                    ),
                  ],
                ),
                Text(
                    "${S.of(context).currency(repair.price.toStringAsFixed(2))}"),
                Text(repair.milage.toString() + " km"),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(DateFormat(S.of(context).date_format_to_show)
                  .format(repair.date)),
            )
          ],
        ),
      ),
    );
  }
}
