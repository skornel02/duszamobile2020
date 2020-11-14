import 'package:duszamobile2020/route/add_car_page.dart';
import 'package:duszamobile2020/route/cars_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatelessWidget {


	MainPage(){
		debugPrint("Created Mainpage");
	}

	List<Widget> pages =  [
		CarsPage(),
		AddCarPage(),
		AddCarPage(),
		AddCarPage()
	];



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


	@override
	Widget build(BuildContext context){
		return Scaffold(

			body: ,
			bottomNavigationBar: BottomNavigationBar(
				currentIndex: 0, // this will be set when a new tab is tapped
				
				items: [
					BottomNavigationBarItem(
						icon: new Icon(Icons.home),
						title: new Text('Home'),
					),
					BottomNavigationBarItem(
						icon: new Icon(Icons.mail),
						title: new Text('Messages'),
					),
					BottomNavigationBarItem(
							icon: Icon(Icons.person),
							title: Text('Profile')
					)
				],
		),
		);
	}
}
