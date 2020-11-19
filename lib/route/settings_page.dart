import 'dart:convert';
import 'dart:io';

import 'package:duszamobile2020/blocs/google_bloc/bloc/google_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/notification_service.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:duszamobile2020/widgets/google_sync.dart';
import 'package:duszamobile2020/widgets/language_changer.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).user_settings),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => GoogleBloc(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(child: GoogleSync()),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(S.of(context).language),
                    ),
                    Spacer(),
                    LanguageChanger(),
                  ],
                ),
                SwitchListTile(
                  value: DynamicTheme.of(context).brightness == Brightness.dark,
                  title: Text(S.of(context).dark_theme),
                  onChanged: (val) async {
                    setDarkMode(val);
                    DynamicTheme.of(context).setBrightness(
                        val ? Brightness.dark : Brightness.light);
                  },
                ),
                RaisedButton(
                  child: Text(S.of(context).test_notification),
                  onPressed: kIsWeb
                      ? null
                      : () =>
                          NotificationService.showNotificationWithReminders(),
                ),
                RaisedButton(
                  child: Text(S.of(context).export_json),
                  onPressed: () async {
                    final directory = await getApplicationDocumentsDirectory();
                    final path = directory.path;
                    final file = File('$path/cars.json');
                    final cars = await CarRepository().getCars();
                    await file.writeAsString(json.encode(cars));
                    Share.shareFiles(['${file.path}'],
                        text: S.of(context).export_json);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
