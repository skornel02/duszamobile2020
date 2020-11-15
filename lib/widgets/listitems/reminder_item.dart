import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

enum ReminderItemType { ACTIVE, UPCOMING, EXPIRED }

class ReminderItem extends StatelessWidget {
  final Reminder reminder;
  final ReminderItemType type;

  final int index;

  ReminderItem(this.reminder, this.type, {@required this.index});

  void _onOpen(BuildContext context) async {
    final carBloc = BlocProvider.of<CarBloc>(context);
    ReadyState state = carBloc.state;

    switch (type) {
      case ReminderItemType.UPCOMING:
        print("Opening reminder #${reminder.id}");
        Navigator.pushNamed(
            context, "/cars/${state.car.id}/reminders/${reminder.id}");
        break;
      case ReminderItemType.ACTIVE:
        await showConfirmAlert(
          context,
          title: S.of(context).are_you_sure,
          description: S.of(context).complete_reminder(reminder.name),
          onAccept: () async {
            Reminder completed = Reminder.from(
              reminder,
              completed: true,
              afterDays: reminder.afterDays,
              afterMilage: reminder.afterMilage,
            );

            await showConfirmAlert(context,
                title: S.of(context).are_you_sure,
                description: S.of(context).repeat_this_reminder_again,
                onAccept: () async {
              Reminder next = completed.getSuggestion(
                  DateTime.now(), state.car.totalMilage);
              carBloc.add(SaveReminderItem(next));
              await carBloc.first;
              Navigator.pushNamed(
                  context, "/cars/${state.car.id}/reminders/${next.id}");
            });

            carBloc.add(SaveReminderItem(completed));
          },
        );

        break;
    }
  }

  void _onRemove(BuildContext context) {
    showConfirmAlert(
      context,
      title: S.of(context).are_you_sure,
      description: S
          .of(context)
          .do_you_want_to(S.of(context).do_remove_reminder(reminder.name)),
      onAccept: () {
        BlocProvider.of<CarBloc>(context).add(RemoveReminderItem(reminder.id));
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
              Text(
                (index + 1).toString(),
                style: TextStyle(fontSize: 30),
              ),
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
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(reminder.date != null
                      ? DateFormat(S.of(context).date_format_to_show)
                          .format(reminder.date)
                      : ""),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.times),
                    onPressed: () => _onRemove(context),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
