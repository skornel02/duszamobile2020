import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RemindersPage extends StatelessWidget {
	RemindersPage({Key key}) : super(key: key){
		debugPrint("Created RemindersPage");

	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			body: ListView.builder(itemBuilder: (context, index){

			}),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add),
				onPressed: (){
					Navigator.pushNamed(context, "/cars/add");
				},
			),
		);
	}
}
