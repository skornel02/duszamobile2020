import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/route/reminder_page.dart';
import 'package:duszamobile2020/route/repairs_page.dart';
import 'package:duszamobile2020/route/statistics_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'evignettes_page.dart';

class MainPage extends StatelessWidget {

	final String path;
	MainPage(this.path){
		debugPrint("Created Mainpage");
	}


	String getCurrentPageTitle(context){
		switch(path){
			case "statistics":
				return S.of(context).statistics + ": ";
			case "repairs":
				return S.of(context).repairs + ": ";
			case "refuels":
				return S.of(context).refuels + ": ";
			case "reminders":
				return S.of(context).reminders  + ": ";
			case "evignettes":
				return S.of(context).evignettes + ": ";
		}
		return "";
  }

	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar( title: Text(getCurrentPageTitle(context) + "current_car_name"),),
			drawer: SafeArea(
			  child: Drawer(
			  	child: Column(
			  		children: [
			  			ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("tankolás"),
			  			onTap: (){
			  				Navigator.pop(context);
			  				Navigator.pushNamedAndRemoveUntil(context, "/cars/1/refuels", (a) => false);
			  			},
			  			),
			  			ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Szervizek"),
			  				onTap: (){
			  					Navigator.pop(context);
			  					Navigator.pushNamedAndRemoveUntil(context, "/cars/1/repairs", (a) => false);
			  				},
			  			),
							ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Értesitők"),
								onTap: (){
									Navigator.pop(context);
									Navigator.pushNamedAndRemoveUntil(context, "/cars/1/reminders", (a) => false);
								},
							),
							ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Autópálya matricák"),
								onTap: (){
									Navigator.pop(context);
									Navigator.pushNamedAndRemoveUntil(context, "/cars/1/evignettes", (a) => false);
								},
							),
							ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Statisztikák"),
								onTap: (){
									Navigator.pop(context);
									Navigator.pushNamedAndRemoveUntil(context, "/cars/1/statistics", (a) => false);
								},
							),
							ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Felhasználói beállitás"),
								onTap: (){
									Navigator.pop(context);
									Navigator.pushNamed(context, "/settings");
								},
							),
							ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Autó beállítások"),
								onTap: (){
									Navigator.pop(context);
									Navigator.pushNamed(context, "/cars/1/settings");
								},
							),
			  		],
			  	),
			  ),
			),
			body: Builder(
				builder: (c){
					debugPrint("asdsadsad: " + path);
					switch(path){
						case "statistics":
							return StatisticsPage();
						case "repairs":
							return RepairsPage();
						case "refuels":
							return RepairsPage();//RefuelsPage();
						case "reminders":
							return RemindersPage();
						case "evignettes":
							return EVignettesPage();
					}
					return null;
				},
			),
		);
	}
}
