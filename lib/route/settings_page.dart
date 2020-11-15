import 'package:duszamobile2020/blocs/google_bloc/bloc/google_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/widgets/google_sync.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';

class SettingsPage extends StatefulWidget {
	SettingsPage({Key key}) : super(key: key);

	@override
	_SettingsPageState createState()=> _SettingsPageState();
}

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
								child: Text(S.of(context).google_login),
								onPressed: (){

								}),
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
						SwitchListTile(value: darkTheme,
							title: Text(S.of(context).dark_theme),
							onChanged: (val){
								setState(() {
									darkTheme = val;
								});
							},
						),
						DropdownButton(
							onChanged: (val){
								setState(() {
									langVal = val;
								});
							},
							value: langVal,
							items: [DropdownMenuItem(child: Text("Magyar"), value: "hu",),
								DropdownMenuItem(child: Text("English"), value: "en",)
							],
						),

						Divider(),

						RaisedButton(
								child: Text(S.of(context).export),
								onPressed: (){

								})
					],
				),
			),
		);
	}
}
*/
