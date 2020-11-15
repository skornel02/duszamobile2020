import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class RefuelForm extends StatefulWidget {
	final Future<void> Function(Refuel refuel) callback;
	final Refuel refuel;
	RefuelForm({@required this.callback, this.refuel, Key key}) : super(key: key);

	@override
	_RefuelFormState createState() => _RefuelFormState();
}

class _RefuelFormState extends State<RefuelForm> {
	final _formKey = GlobalKey<FormState>();

	TextEditingController _priceTextEditingController = TextEditingController();
	TextEditingController _milageTextEditingController = TextEditingController();
	TextEditingController _lastMilageTextEditingController = TextEditingController();

	double refuelAmount = 15;

	bool isLastRefuelRecorded = true;
	DateTime date;

	@override
	void initState() {
		if (widget.refuel != null) {
			_priceTextEditingController.text = widget.refuel.paid.toString();
			_milageTextEditingController.text = widget.refuel.milage.toString();
			_lastMilageTextEditingController.text = widget.refuel.lastMilage.toString();
			refuelAmount = widget.refuel.refueled;
			if(widget.refuel.lastMilage != null){
				isLastRefuelRecorded = true;
			}
			date = widget.refuel.date;

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
				  					SizedBox(
				  							width: 50,
				  							child: Text(refuelAmount.toStringAsFixed(1) + " l")
				  					),
				  					Slider(
				  							min: 0,
				  							max: 100,
				  							value: refuelAmount,
				  							onChanged: (val) {
				  								setState(() {
				  									refuelAmount = val;
				  								});
				  							})
				  				],
				  			),
				  			Divider(),
				  			Padding(
				  				padding: const EdgeInsets.only(top: 10),
				  				child: TextFormField(
				  					style: TextStyle(fontSize: 18),
				  					maxLines: 1,
				  					keyboardType: TextInputType.number,
				  					controller: _priceTextEditingController,
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
				  			Padding(
				  				padding: const EdgeInsets.only(top: 10),
				  				child: TextFormField(
				  					style: TextStyle(fontSize: 18),
				  					maxLines: 1,
				  					inputFormatters: [
				  						FilteringTextInputFormatter.digitsOnly
				  					],
				  					keyboardType: TextInputType.number,
				  					controller: _milageTextEditingController,
				  					textInputAction: TextInputAction.next,
				  					decoration: InputDecoration(
				  						labelText: S
				  								.of(context)
				  								.milometer, // helperText: "Oktatási azonositó",
				  						alignLabelWithHint: true,
				  						labelStyle: TextStyle(),
				  						filled: true,
				  						fillColor: Colors.grey.withAlpha(120),
				  					),
				  					validator: (value) {
				  						if (value.isEmpty) {
				  							return S
				  									.of(context)
				  									.cant_be_empty(S.of(context).milometer);
				  						}
				  						return null;
				  					},
				  				),
				  			),
				  			CheckboxListTile(
				  					title: Text(S.of(context).last_refuel_was_recorded),
				  					value: isLastRefuelRecorded,
				  					onChanged: (val) {
				  						setState(() {
				  							isLastRefuelRecorded = val;
				  						});
				  					}),
				  			Padding(
				  				padding: const EdgeInsets.only(top: 10),
				  				child: TextFormField(
				  					enabled: isLastRefuelRecorded,
				  					style: TextStyle(fontSize: 18),
				  					maxLines: 1,
				  					controller: _lastMilageTextEditingController,
				  					textInputAction: TextInputAction.next,
				  					decoration: InputDecoration(
				  						labelText: "Valami",
				  						alignLabelWithHint: true,
				  						labelStyle: TextStyle(),
				  						filled: true,
				  						fillColor: Colors.grey.withAlpha(120),
				  					),
				  					validator: (value) {
				  						return null;
				  					},
				  				),

				  			),
				  			Divider(),
				  			Row(
				  				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				  				children: [
				  					Text("${S.of(context).liter_price}: 0"),
				  					Text("${S.of(context).consumption}: 0"),
				  				],
				  			),

				  			Spacer(),

				  			RaisedButton(
				  				child: Text(widget.refuel == null
				  						? S.of(context).create
				  						: S.of(context).save),
				  				onPressed: () {
				  					if (_formKey.currentState.validate()) {
				  						double cost = 0;
				  						int milage = 0;
				  						int lastMilage = 0;
				  						try{
				  							cost = double.parse(_priceTextEditingController.text);
				  						}catch(_){}

				  						try{
				  							milage = int.parse(_milageTextEditingController.text);
				  						}catch(_){}
				  						try{
				  							lastMilage = int.parse(_lastMilageTextEditingController.text);
				  						}catch(_){}


				  						Refuel next;

				  						if (widget.refuel != null) {
				  							next = Refuel.from(
				  								widget.refuel,

				  							);
				  							print("NEW ID: ${next.id}");
				  						} else {
				  							next = Refuel.create(
				  										id: Uuid().v4(), date: date, refueled: refuelAmount,
				  										paid: cost, milage: milage, lastMilage: lastMilage
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
