import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddRefuelPage extends StatefulWidget {
	AddRefuelPage({Key key}) : super(key: key);

	@override
	_AddRefuelPageState createState()=> _AddRefuelPageState();
}

class _AddRefuelPageState extends State<AddRefuelPage> {

	TextEditingController textEditingControllerPrice = TextEditingController();
	TextEditingController textEditingControllerTotalMilage= TextEditingController();
	TextEditingController textEditingControllerLastMilage= TextEditingController();

	double refuelAmount = 15;

	bool isLastRefuelRecorded = true;
	
	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
					title: Text("Autó hozzáadás"),
				),
				body: Column(
					children: [
						InputDatePickerFormField(),
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
						
						Divider(),

						Padding(
							padding: const EdgeInsets.only(top: 10),
							child: TextField(
								autofocus: true,
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
							padding: const EdgeInsets.only(top:10),
							child: TextField(
								style: TextStyle(fontSize: 18),
								maxLines: 1,

								controller: textEditingControllerTotalMilage,
								textInputAction: TextInputAction.next,
								decoration:
								InputDecoration(labelText: S.of(context).milometer,// helperText: "Oktatási azonositó",
									alignLabelWithHint: true,
									labelStyle: TextStyle(

									),
									filled: true,
									fillColor: Colors.grey.withAlpha(120),
								),
							),
						),

						CheckboxListTile(
								title: Text(S.of(context).last_refuel_was_recorded),
								value: isLastRefuelRecorded,
								onChanged: (val){
									setState(() {
									  isLastRefuelRecorded = val;
									});
						}),

						Padding(
							padding: const EdgeInsets.only(top:10),
							child: TextField(
								enabled: isLastRefuelRecorded,
								style: TextStyle(fontSize: 18),
								maxLines: 1,
								controller: textEditingControllerLastMilage,
								textInputAction: TextInputAction.next,
								decoration:
								InputDecoration(labelText: "Valami",
									alignLabelWithHint: true,
									labelStyle: TextStyle(

									),
									filled: true,
									fillColor: Colors.grey.withAlpha(120),
								),
							),
						),

						Divider(),

						Row(
							children: [
								Text("${S.of(context).liter_price}: 0"),
								Text("${S.of(context).consumption}: 0"),
							],
						)

					],
				)
		);
	}
}
