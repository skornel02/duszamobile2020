import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/resources/repair.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class RepairForm extends StatefulWidget {
	final Future<void> Function(Repair repair) callback;
	final Repair repair;
	RepairForm({@required this.callback, this.repair, Key key}) : super(key: key);

	@override
	_RepairFormState createState() => _RepairFormState();
}

class _RepairFormState extends State<RepairForm> {
	final _formKey = GlobalKey<FormState>();

	TextEditingController _reasonTextEditingController = TextEditingController();
	TextEditingController _descriptionTextEditingController = TextEditingController();
	TextEditingController _costTextEditingController = TextEditingController();


	DateTime date;
	double milage = 15;
	List<String> items = [];
	bool warranty = true;


	@override
	void initState() {
		if (widget.repair != null) {
			_reasonTextEditingController.text = widget.repair.reason;
			_descriptionTextEditingController.text = widget.repair.description;
			_costTextEditingController.text = widget.repair.price.toString();

			milage = widget.repair.milage as double;
			date = widget.repair.date;
			items = widget.repair.items;
			warranty = widget.repair.warranty;
		}else{
			_costTextEditingController.text = "0";
		}

		super.initState();
	}


	@override
	Widget build(BuildContext context) {
		return Form(
			key: _formKey,
			child: SingleChildScrollView(
				child: SizedBox(
					height: MediaQuery.of(context).size.height -
							MediaQuery.of(context).padding.top -
							kToolbarHeight*2,
					child: Padding(
						padding: const EdgeInsets.all(16),
						child: Column(
							children: [

								Padding(
									padding: const EdgeInsets.only(top: 10),
									child: TextFormField(
										style: TextStyle(fontSize: 18),
										maxLines: 1,
										controller: _reasonTextEditingController,
										textInputAction: TextInputAction.next,
										decoration: InputDecoration(
											labelText: S
													.of(context)
													.reason,
											alignLabelWithHint: true,
											labelStyle: TextStyle(),
											filled: true,
											fillColor: Colors.grey.withAlpha(120),
										),
										validator: (value) {
											if (value.isEmpty) {
												return S
														.of(context)
														.cant_be_empty(S.of(context).reason);
											}
											return null;
										},
									),
								),
								Padding(
									padding: const EdgeInsets.only(top: 10),
									child: TextFormField(
										style: TextStyle(fontSize: 18),
										maxLines: 1,
										controller: _descriptionTextEditingController,
										textInputAction: TextInputAction.next,
										decoration: InputDecoration(
											labelText: S
													.of(context)
													.description,
											alignLabelWithHint: true,
											labelStyle: TextStyle(),
											filled: true,
											fillColor: Colors.grey.withAlpha(120),
										),
										validator: (value) {
											if (value.isEmpty) {
												return S
														.of(context)
														.cant_be_empty(S.of(context).description);
											}
											return null;
										},
									),
								),
								Padding(
									padding: const EdgeInsets.only(top: 10),
									child: TextFormField(
										style: TextStyle(fontSize: 18),
										maxLines: 1,
										inputFormatters: [
											FilteringTextInputFormatter.digitsOnly
										],
										keyboardType: TextInputType.number,
										controller: _costTextEditingController,
										textInputAction: TextInputAction.next,
										decoration: InputDecoration(
											labelText: S
													.of(context)
													.price, // helperText: "Oktatási azonositó",
											alignLabelWithHint: true,
											labelStyle: TextStyle(),
											filled: true,
											fillColor: Colors.grey.withAlpha(120),
										),
										validator: (value) {
											if (value.isEmpty) {
												return S
														.of(context)
														.cant_be_empty(S.of(context).price);
											}
											return null;
										},
									),
								),

								Divider(),

								Row(
									children: [
										SizedBox(
												width: 50,
												child: Text(milage.toStringAsFixed(1) + " km")
										),
										Slider(
												min: 0,
												max: 100,
												value: milage,
												onChanged: (val) {
													setState(() {
														milage = val;
													});
												})
									],
								),
								DateTimeField(
									initialValue: date,
									style: TextStyle(fontSize: 18),
									decoration: InputDecoration(
										labelText: S.of(context).date,
										alignLabelWithHint: true,
										labelStyle: TextStyle(),
										filled: true,
										fillColor: Colors.grey.withAlpha(120),
									),
									format: DateFormat(S.of(context).date_format),
									onChanged: (DateTime newDate){
										date = newDate;
									},
									onShowPicker: (context, currentValue) {
										return showDatePicker(
												context: context,
												firstDate: DateTime.now().subtract(Duration(days: 365)),
												initialDate: currentValue ?? DateTime.now(),
												lastDate: DateTime.now());
									},
								),

								Row(
									children: [
										RadioListTile(
											title: Text(S.of(context).warranty),
											value: true,
											groupValue: warranty,
											onChanged: (val){
												setState(() {
												  warranty = val;
												});
											}
										),
										RadioListTile(
												title: Text(S.of(context).not_warranty),
												value: false,
												groupValue: warranty,
												onChanged: (val){
													setState(() {
														warranty = val;
													});
												}
										)
									],
								),

								Divider(),

								//TODO: tétel hozzáadás widget

								Spacer(),

								RaisedButton(
									child: Text(widget.repair == null
											? S.of(context).create
											: S.of(context).save),
									onPressed: () {
										if (_formKey.currentState.validate()) {
											Repair next;

											double price = 0;

											try{
												price = double.parse(_costTextEditingController.text);
											}catch(_){}

											if (widget.repair != null) {
												next = Repair.from(
													widget.repair,

												);
												print("NEW ID: ${next.id}");
											} else {
												next = Repair.create(
													id: Uuid().v4(),
													date: date,
													milage: milage.round(),
													price: price,
													reason: _reasonTextEditingController.text,
													description: _descriptionTextEditingController.text,
													items: items,
													warranty: warranty
												);
											}

											widget.callback(next);
										}
									},
								),
							],
						),
					),
				),
			),
		);
	}
}
