import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddRefuelPage extends StatefulWidget {
	AddRefuelPage({Key key}) : super(key: key);

	@override
	_AddRefuelPageState createState()=> _AddRefuelPageState();
}

class _AddRefuelPageState extends State<AddRefuelPage> {

	TextEditingController textEditingControllerName = TextEditingController();
	TextEditingController textEditingControllerPrice= TextEditingController();
	TextEditingController textEditingControllerYear= TextEditingController();


	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
					title: Text("Autó hozzáadás"),
				),
				body: Padding(
					padding: const EdgeInsets.all(16),
					child: Column(
						children: [
							IconButton(icon: Icon(FontAwesomeIcons.image,), iconSize: 80,
									onPressed: (){
										// add image of car
									}),

							Padding(
								padding: const EdgeInsets.only(top: 10),
								child: TextField(
									autofocus: true,
									style: TextStyle(fontSize: 18),
									maxLines: 1,

									controller: textEditingControllerName,
									textInputAction: TextInputAction.next,
									decoration:
									InputDecoration(labelText: "Név",// helperText: "Oktatási azonositó",
										alignLabelWithHint: true,
										labelStyle: TextStyle(

										),
										filled: true,
										fillColor: Colors.grey.withAlpha(120),
									),
								),
							),
							Padding(
								padding: const EdgeInsets.only(top:10),
								child: TextField(
									style: TextStyle(fontSize: 18),
									maxLines: 1,

									controller: textEditingControllerPrice,
									textInputAction: TextInputAction.next,
									decoration:
									InputDecoration(labelText: "Pénz",// helperText: "Oktatási azonositó",
										alignLabelWithHint: true,
										labelStyle: TextStyle(

										),
										filled: true,
										fillColor: Colors.grey.withAlpha(120),
									),
								),
							),
							Padding(
								padding: const EdgeInsets.only(top: 10),
								child: TextField(
									style: TextStyle(fontSize: 18),
									maxLines: 1,

									controller: textEditingControllerYear,
									textInputAction: TextInputAction.next,
									decoration:
									InputDecoration(labelText: "Év",// helperText: "Oktatási azonositó",
										alignLabelWithHint: true,
										labelStyle: TextStyle(

										),
										filled: true,
										fillColor: Colors.grey.withAlpha(120),
									),
								),
							),
							Spacer(),
							RaisedButton(
								child: Text("Hozzáadás"),
								onPressed: (){
									// notify bloc
								},
							),
						],
					),
				)
		);
	}
}
