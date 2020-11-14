import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarSettingsPage extends StatefulWidget {
	CarSettingsPage({Key key}) : super(key: key);

	@override
	_CarSettingsPageState createState()=> _CarSettingsPageState();
}

class _CarSettingsPageState extends State<CarSettingsPage> {

	TextEditingController textEditingControllerName = TextEditingController();
	TextEditingController textEditingControllerPrice= TextEditingController();
	TextEditingController textEditingControllerYear= TextEditingController();

	String tyreType;

	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
					title: Text(S.of(context).edit_car),
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
									InputDecoration(labelText:  S.of(context).name,// helperText: "Oktatási azonositó",
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
									InputDecoration(labelText: S.of(context).price,// helperText: "Oktatási azonositó",
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
									InputDecoration(labelText: S.of(context).year,// helperText: "Oktatási azonositó",
										alignLabelWithHint: true,
										labelStyle: TextStyle(

										),
										filled: true,
										fillColor: Colors.grey.withAlpha(120),
									),
								),
							),
							Row(
								children: [
									Text("${S.of(context).tyre_type}:"),
									DropdownButton(
											value: tyreType,
											items: [
												DropdownMenuItem(child: Text(S.of(context).tyre_type_winter), value: "tyre_type_winter"),
												DropdownMenuItem(child: Text(S.of(context).tyre_type_summer), value: "tyre_type_summer"),
												DropdownMenuItem(child: Text(S.of(context).tyre_type_all_year), value: "tyre_type_all_year"),
												DropdownMenuItem(child: Text(S.of(context).tyre_type_other), value: "tyre_type_other"),
											],
											onChanged: (val){
												setState(() {
													tyreType = val;
												});
											}
									)
								],
							),


							Spacer(),
							RaisedButton(
								child: Text(S.of(context).edit),
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
