import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReminderItem extends StatelessWidget {
  final Reminder reminder;

  final int index;

  ReminderItem(this.reminder, {@required this.index});

  void _onOpen(BuildContext context) {
    ReadyState state = BlocProvider.of<CarBloc>(context).state;
    print("Opening reminder #${reminder.id}");
    Navigator.pushNamed(context, "/cars/${state.car.id}/reminders/${reminder.id}");
  }

  void _onRemove(BuildContext context) {
    showConfirmAlert(
      context,
      title: S.of(context).are_you_sure,
      description: S.of(context).do_you_want_to(S.of(context).do_remove_refuel(
          DateFormat(S.of(context).date_format).format(reminder.date))),
      onAccept: () {
        BlocProvider.of<CarBloc>(context).add(RemoveRefuelItem(reminder.id));
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
        child: Row(
          children: [
            Text((index+1).toString(), style: TextStyle(fontSize: 30),),
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(reminder.name),
                    Text(reminder.description),
                  //  Text(reminder?.daysLeft?.toString() ?? ""),
                 //   Text(reminder?.milageLeft?.toString() ?? ""),

                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(reminder.date != null
                      ? DateFormat(S.of(context).date_format_to_show).format(reminder.date)
                      : ""
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
