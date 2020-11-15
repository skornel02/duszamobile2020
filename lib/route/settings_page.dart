import 'package:duszamobile2020/blocs/google_bloc/bloc/google_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:duszamobile2020/widgets/google_sync.dart';
import 'package:duszamobile2020/widgets/language_changer.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: Column(
            children: [
              Text("TItle"),
              Text("Egy kis leírás"),
              GoogleSync(),
              LanguageChanger(),
              SwitchListTile(
                value: DynamicTheme.of(context).brightness == Brightness.dark,
                title: Text(S.of(context).dark_theme),
                onChanged: (val) async {
                  setDarkMode(val);
                  DynamicTheme.of(context)
                      .setBrightness(val ? Brightness.dark : Brightness.light);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class _SettingsPageState extends State<SettingsPage> {

	bool calendarSync = true;
	bool darkTheme = false;

	String langVal = "en";

	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(title: Text(S.of(context).user_settings),),
			body: Center(
				child: Column(
					children: [
						RaisedButton(
								child: Text(S.of(context).synchronise),
								onPressed: (){

								}),
						SwitchListTile(value: calendarSync,
							title: Text(S.of(context).calendar_synchronisation),
							onChanged: (val){
								setState(() {
									calendarSync = val;
								});
							},
						),
					],
				),
			),
		);
	}
}
*/
