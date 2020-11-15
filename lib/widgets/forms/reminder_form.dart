import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ReminderForm extends StatefulWidget {
	final Future<void> Function(Reminder reminder) callback;
	final Reminder reminder;
	ReminderForm({@required this.callback, this.reminder, Key key}) : super(key: key);

	@override
	_ReminderFormState createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
	final _formKey = GlobalKey<FormState>();

	TextEditingController _nameTextEditingController = TextEditingController();
	TextEditingController _descriptionTextEditingController = TextEditingController();

	List<String> items;
	DateTime date;
	int afterDays;
	int startMilage;
	int afterMilage = 15;
	bool completed;


	bool notifyOnDate = false;
	bool notifyAfterKilometers = true;


	@override
	void initState(){
		if(widget.reminder != null){
			_nameTextEditingController.text = widget.reminder.name;
			_descriptionTextEditingController.text = widget.reminder.description;

			super.initState();
		}
	}

	@override
	Widget build(BuildContext context){
		return Form(
			key: _formKey,
			child: SingleChildScrollView(
				child: SizedBox(
					height: MediaQuery
							.of(context)
							.size
							.height -
							MediaQuery
									.of(context)
									.padding
									.top -
							kToolbarHeight * 2,
					child: Padding(
						padding: const EdgeInsets.all(16),
						child: Column(
							children: [
								Padding(
									padding: const EdgeInsets.only(top: 10),
									child: TextFormField(
										style: TextStyle(fontSize: 18),
										maxLines: 1,
										controller: _nameTextEditingController,
										textInputAction: TextInputAction.next,
										decoration: InputDecoration(
											labelText: S
													.of(context)
													.name,
											alignLabelWithHint: true,
											labelStyle: TextStyle(),
											filled: true,
											fillColor: Colors.grey.withAlpha(120),
										),
										validator: (value){
											if(value.isEmpty){
												return S
														.of(context)
														.cant_be_empty(S
														.of(context)
														.name);
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
										validator: (value){
											return null;
										},
									),
								),

								Divider(),

								CheckboxListTile(
										title: Text(S
												.of(context)
												.notify_on_date),
										value: notifyOnDate,
										onChanged: (val){
											setState((){
												notifyOnDate = val;
											});
										}
								),
								DateTimeField(
									enabled: notifyOnDate,
									initialValue: date,
									style: TextStyle(fontSize: 18),
									decoration: InputDecoration(
										labelText: S
												.of(context)
												.date,
										alignLabelWithHint: true,
										labelStyle: TextStyle(),
										filled: true,
										fillColor: Colors.grey.withAlpha(120),
									),
									format: DateFormat(S
											.of(context)
											.date_format),
									onChanged: (DateTime newDate){
										date = newDate;
									},
									onShowPicker: (context, currentValue){
										return showDatePicker(
												context: context,
												firstDate: DateTime.now(),
												initialDate: currentValue ?? DateTime.now(),
												lastDate: DateTime.now().add(Duration(days: 365)));
									},
								),

								Divider(),

								CheckboxListTile(
										title: Text(S
												.of(context)
												.notify_after_kilometers),
										value: notifyAfterKilometers,
										onChanged: (val){
											setState((){
												notifyAfterKilometers = val;
											});
										}
								),
								Row(
									children: [
										SizedBox(
												width: 50,
												child: Text("${afterMilage.toInt()} km")
										),
										Slider(
											min: 0,
											max: 100,
											value: afterMilage.toDouble(),
											onChanged: (val){
												setState((){
													afterMilage = val.round();
												});
											})
									],
								),

								//TODO: Add items widget

								Spacer(),

								RaisedButton(
									child: Text(widget.reminder == null
											? S
											.of(context)
											.create
											: S
											.of(context)
											.save),
									onPressed: (){
										if(_formKey.currentState.validate()){
											Reminder next;

											if(widget.reminder != null){
												next = Reminder.from(
													widget.reminder,
													name: _nameTextEditingController.text,
													description: _descriptionTextEditingController.text,
													date: date,
													items: items,
													startMilage: startMilage,
													afterMilage: afterMilage,
													afterDays: afterDays,
													completed: completed,

												);
												print("NEW ID: ${next.id}");
											}else{
												next = Reminder.create(
													id: Uuid().v4(),
													name: _nameTextEditingController.text,
													description: _descriptionTextEditingController.text,
													date: date,
													items: items,
													startMilage: startMilage,
													afterMilage: afterMilage,
													afterDays: afterDays,
													completed: completed,
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
