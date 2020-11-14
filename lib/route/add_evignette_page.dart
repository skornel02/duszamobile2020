import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddEVignettePage extends StatefulWidget {
	AddEVignettePage({Key key}) : super(key: key);

	@override
	_AddRefuelPageState createState()=> _AddRefuelPageState();
}

class _AddRefuelPageState extends State<AddEVignettePage> {

	TextEditingController textEditingControllerName = TextEditingController();
	TextEditingController textEditingControllerDescription= TextEditingController();
	TextEditingController textEditingControllerYear= TextEditingController();

	String selectedType = "Karbantartás";

	bool remindMeDate = false;
	bool remindMeMilage = true;

	double refuelAmount = 15;
	
	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
					title: Text("Autúpálya matrica hozzáadása"),
				),
				body: Padding(
					padding: const EdgeInsets.all(16),
					child: Column(
						children: [
							Column(
								children: [
									RadioListTile(
										value: "Karbantartás",
										groupValue: selectedType,
										title: Text("Karbantartás"),
										onChanged: (val) {
											setState(() {
												selectedType = val;
											});
										},
										activeColor: Colors.red,
									),
									RadioListTile(
										value: "Biztositas",
										groupValue: selectedType,
										title: Text("Biztositas"),
										onChanged: (val) {
											setState(() {
												selectedType = val;
											});
										},
										activeColor: Colors.red,
									),
									RadioListTile(
										value: "Abroncs",
										groupValue: selectedType,
										title: Text("Abroncs"),
										onChanged: (val) {
											setState(() {
												selectedType = val;
											});
										},
										activeColor: Colors.red,
									),
									RadioListTile(
										value: "Egyéb",
										groupValue: selectedType,
										title: Text("Egyéb"),
										onChanged: (val) {
											setState(() {
												selectedType = val;
											});
										},
										activeColor: Colors.red,
									),
								],
							),

							Divider(),

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

									controller: textEditingControllerDescription,
									textInputAction: TextInputAction.next,
									decoration:
									InputDecoration(labelText: "Leírás",// helperText: "Oktatási azonositó",
										alignLabelWithHint: true,
										labelStyle: TextStyle(

										),
										filled: true,
										fillColor: Colors.grey.withAlpha(120),
									),
								),
							),

							Divider(),

							CheckboxListTile(
								title: Text("Figyelmeztesen ekkor:"),
								value: remindMeDate, onChanged: (val){
								setState(() {
									remindMeDate = val;
								});
							}),

							InputDatePickerFormField(

							),

							CheckboxListTile(
								title: Text("Figyelmeztesen ennyi km után:"),
								value: remindMeMilage, onChanged: (val){
								setState(() {
									remindMeMilage = val;
								});

							}),

							Row(
								children: [
									Text(refuelAmount.toString()),
									Slider(
										min: 0,
										max: 200,

										value: refuelAmount, onChanged: (val){
										setState(() {
											refuelAmount = val;
										});
									})
								],
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
