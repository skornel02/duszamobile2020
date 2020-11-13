import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarsPage extends StatelessWidget {
	CarsPage({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
				title: Text("Autóim"),
				centerTitle: true,

				actions: [IconButton(icon: Icon(FontAwesomeIcons.cog), onPressed: (){
					Navigator.pushNamed(context, "/settings");
				})],
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
