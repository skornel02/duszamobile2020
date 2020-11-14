import 'package:duszamobile2020/route/reminder_page.dart';
import 'package:duszamobile2020/route/repairs_page.dart';
import 'package:duszamobile2020/route/statistics_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'evignettes_page.dart';

class MainPage extends StatelessWidget {

	final String path;
	MainPage(this.path){
		debugPrint("Created Mainpage");
	}

	List<PersistentBottomNavBarItem> _navBarsItems() {
		return [
			PersistentBottomNavBarItem(
				icon: Icon(FontAwesomeIcons.gasPump),
				title: ("Home"),
				activeColor: CupertinoColors.activeBlue,
				inactiveColor: CupertinoColors.systemGrey,
			),
			PersistentBottomNavBarItem(
				icon: Icon(CupertinoIcons.chart_bar),
				title: ("Settings"),
				activeColor: CupertinoColors.activeBlue,
				inactiveColor: CupertinoColors.systemGrey,
			),
			PersistentBottomNavBarItem(
				icon: Icon(FontAwesomeIcons.home),
				title: ("Home"),
				activeColor: CupertinoColors.activeBlue,
				inactiveColor: CupertinoColors.systemGrey,
			),
			PersistentBottomNavBarItem(
				icon: Icon(FontAwesomeIcons.calendar),
				title: ("Home"),
				activeColor: CupertinoColors.activeBlue,
				inactiveColor: CupertinoColors.systemGrey,
			),
		];
	}

	int getIndex(context){
		if(path == "settings"){
			return 0;
		}else if(path == "statistics"){
			return 1;
		}else if(path == "repairs"){
			return 2;
		}else if(path == "tyretype"){
			return 3;
		}else if(path == "evignette"){
			return 4;
		}
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar( title: Text("auto"),),
			drawer: SafeArea(
			  child: Drawer(
			  	child: Column(
			  		children: [
			  			ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("tankolás"),
			  			onTap: (){
			  				Navigator.pop(context);
			  				Navigator.pushNamedAndRemoveUntil(context, "/cars/1/refuel", (a) => false);
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
									Navigator.pushNamedAndRemoveUntil(context, "/cars/1/reminder", (a) => false);
								},
							),
							ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Autópálya matricák"),
								onTap: (){
									Navigator.pop(context);
									Navigator.pushNamedAndRemoveUntil(context, "/cars/1/evignette", (a) => false);
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
									Navigator.pushNamedAndRemoveUntil(context, "/settings", (a) => false);
								},
							),
							ListTile(leading: Icon(FontAwesomeIcons.gasPump),title: Text("Autó beállítások"),
								onTap: (){
									Navigator.pop(context);
									Navigator.pushNamedAndRemoveUntil(context, "/cars/1/settings", (a) => false);
								},
							),

			  		],
			  	),
			  ),
			),
			body: Builder(
				builder: (c){
					switch(path){
						case "statistics":
							return StatisticsPage();
						case "repairs":
							return RepairsPage();
						case "reminder":
							return RemindersPage();
						case "evignette":
							return EVignettesPage();
					}
					return null;
				},
			),
			/*
				bottomNavigationBar: BottomNavigationBar(
				backgroundColor: Colors.red,
				currentIndex: getIndex(context),
			//	currentIndex: 0, // this will be set when a new tab is tapped
				onTap: (index){
					switch(index){
						case 0:
							Navigator.pushNamedAndRemoveUntil(context, "/cars/1/settings", (a) => false);
							break;
						case 1:
							Navigator.pushNamedAndRemoveUntil(context, "/cars/1/statistics", (a) => false);
							break;
					}
				},
				items: [
					BottomNavigationBarItem(
						icon: new Icon(FontAwesomeIcons.gasPump, color: Colors.black,),
						label: "gaspump",
					),
					BottomNavigationBarItem(
						icon: new Icon(FontAwesomeIcons.chartBar, color: Colors.black,),
						label: "chartbar",
					),
		/*
					BottomNavigationBarItem(
							icon: Icon(FontAwesomeIcons.home, color: Colors.black,),
							label: "home"
					),
					BottomNavigationBarItem(
							icon: Icon(FontAwesomeIcons.calendar, color: Colors.black,),
							label: "calendar"
					)
					*/
				],
			),
			*/
		);
	}
}
