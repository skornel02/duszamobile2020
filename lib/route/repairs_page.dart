import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepairsPage extends StatelessWidget {
	RepairsPage({Key key}) : super(key: key){
		debugPrint("Created RepairsPage");

	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			body: Column(
				children: [
					Container(),
					ListView.builder(
						
						itemBuilder: (context, index){

						},
					)
				],
			),
			floatingActionButton: FloatingActionButton(
				child: Icon(FontAwesomeIcons.plus),
				onPressed: (){
					
				},
				
			),
		);
	}
}
