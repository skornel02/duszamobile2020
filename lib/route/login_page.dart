import 'package:flutter/material.dart';
import 'package:duszamobile2020/generated/l10n.dart';

class LoginPage extends StatefulWidget {
	LoginPage({Key key}) : super(key: key);

	@override
	_LoginPageState createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
						SwitchListTile(value: calendarSync,
							title: Text(S.of(context).dark_theme),
							onChanged: (val){
								setState(() {
									calendarSync = val;
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