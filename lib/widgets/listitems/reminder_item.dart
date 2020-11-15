import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

enum ReminderItemType { ACTIVE, UPCOMING, EXPIRED }

class ReminderItem extends StatelessWidget {
  final Reminder reminder;
  final ReminderItemType type;

  ReminderItem(this.reminder, this.type);

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
      default:
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
              Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Tags(
                              alignment: WrapAlignment.start,
                              itemCount: reminder.items.length,
                              itemBuilder: (int index) {
                                final item = reminder.items[index];
                                return ItemTags(
                                  pressEnabled: false,
                                  key: Key(index.toString()),
                                  index: index,
                                  title: item,
                                  active: true,
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  onPressed: (item) => print(item),
                                  onLongPressed: (item) => print(item),
                                );
                              }),
                        ),
                      ),
                      Text(reminder.name),
                      Text(reminder.description),

                      if(reminder.afterDays != null) Text(reminder.daysLeft.toString() + " days "),
                      if(reminder.afterMilage != null)Text(reminder.milageLeft.toString() + " km"),

                      //  Text(reminder?.daysLeft?.toString() ?? ""),
                      //   Text(reminder?.milageLeft?.toString() ?? ""),
                    ],
                  ),


                ],
              ),
              Spacer(),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
              ),

            ],
          )),
    );
  }
}
