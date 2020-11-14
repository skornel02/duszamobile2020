import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCarPage extends StatelessWidget {
	AddCarPage({Key key}) : super(key: key){
		debugPrint("Created AddCarPage");
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
				title: Text("Autó hozzáadás"),
			),
			body: new RefreshIndicator(
					child: Center(child: Text("Choose cars here"),),
					onRefresh: () {} //await getData()
			),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add),
				onPressed: (){
					Navigator.pushNamed(context, "/cars/add");
				},
			),
		);
	}
}
