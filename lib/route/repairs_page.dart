import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/widgets/listitems/repair_item.dart';
import 'package:flutter/material.dart';

class RepairsPage extends StatelessWidget {
	RepairsPage({Key key}) : super(key: key){
		debugPrint("Created RepairsPage");

	}

	List<Repair> repairs = [Repair.create(id: "ID", date: DateTime.now(), milage: Random().nextInt(20000), price: 31415135, reason: "", items: ["asd", "assgsg"], description: "description", warranty:false),
		Repair.create(id: "ID", date: DateTime.now(), milage: Random().nextInt(20000), price: 31415135, reason: "", items: ["asd", "assgsg"], description: "description", warranty:false),
		Repair.create(id: "ID", date: DateTime.now(), milage: Random().nextInt(20000), price: 31415135, reason: "", items: ["asd", "assgsg"], description: "description", warranty:false),
		Repair.create(id: "ID", date: DateTime.now(), milage: Random().nextInt(20000), price: 31415135, reason: "", items: ["asd", "assgsg"], description: "description", warranty:false),
		Repair.create(id: "ID", date: DateTime.now(), milage: Random().nextInt(20000), price: 31415135, reason: "", items: ["asd", "assgsg"], description: "description", warranty:false),
	];


	@override
	Widget build(BuildContext context){
		return Scaffold(
			body: Column(
				children: [
					Container(
						height: 200,
					),
					Expanded(
					  child: ListView.builder(
							itemCount: repairs.length,
					  	itemBuilder: (context, index){
					  		return RepairItem(repairs[index]);
					  	},
					  ),
					)
				],
			),
			floatingActionButton: FloatingActionButton(
				child: Icon(FontAwesomeIcons.plus),
				onPressed: (){
					Navigator.pushNamed(context, "/cars/1/repairs/add");
				},

			),
		);
	}
}
