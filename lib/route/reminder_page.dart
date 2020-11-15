import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:duszamobile2020/widgets/car_drawer.dart';
import 'package:duszamobile2020/widgets/listitems/reminder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RemindersPage extends StatelessWidget {
  final String id;
  RemindersPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created RemindersPage");
  }

  void _onAdd(BuildContext context) {
    Navigator.pushNamed(context, "/cars/${id}/reminders/add");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).reminders),
      ),
      drawer: carDrawer(context, id, selectedMenu: DrawerItem.REMINDER),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is ReadyState) {
            final car = state.car;

            List<Reminder> active = List();
            List<Reminder> upcoming = List();
            List<Reminder> expired = List();

            car.reminds.forEach((reminder) {
              if (reminder.completed) {
                expired.add(reminder);
              } else if (reminder.isDue(DateTime.now(), car.totalMilage)) {
                active.add(reminder);
              } else {
                upcoming.add(reminder);
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
                      return ReminderItem(
                        active[index],
                        ReminderItemType.ACTIVE,
                      );
                    },
                  ),
                  Divider(),
                  Center(
                    child: Text(
                      S.of(context).upcoming,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: upcoming.length,
                    itemBuilder: (context, index) {
                      return ReminderItem(
                        upcoming[index],
                        ReminderItemType.UPCOMING,
                      );
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
                      return ReminderItem(
                        expired[index],
                        ReminderItemType.EXPIRED,
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () => _onAdd(context),
      ),
    );
  }
}
