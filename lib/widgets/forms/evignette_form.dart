import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/e_vignette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class EVignetteForm extends StatefulWidget {
	final Future<void> Function(EVignette eVignette) callback;
	final EVignette eVignette;
	EVignetteForm({@required this.callback, this.eVignette, Key key}) : super(key: key);

	@override
	_EVignetteFormState createState() => _EVignetteFormState();
}

class _EVignetteFormState extends State<EVignetteForm> {
	final _formKey = GlobalKey<FormState>();

	DateTime startDate;
	int duration;
	String area;

	@override
	void initState() {
		if (widget.eVignette != null) {
			startDate = widget.eVignette.start;
			duration = widget.eVignette.duration;
			area = widget.eVignette.area;
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
									initialValue: startDate,
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
										startDate = newDate;
									},
									onShowPicker: (context, currentValue) {
										return showDatePicker(
												context: context,
												firstDate: DateTime.now().subtract(Duration(days: 365)),
												initialDate: currentValue ?? DateTime.now(),
												lastDate: DateTime.now());
									},
									validator: (value) {
										return null;
									},
								),

								Spacer(),

								RaisedButton(
									child: Text(widget.eVignette == null
											? S.of(context).create
											: S.of(context).save),
									onPressed: () {
										if (_formKey.currentState.validate()) {
											EVignette next;
											if (widget.eVignette != null) {
												next = EVignette.from(
													widget.eVignette,
														start: startDate,
														area: area,
														duration: duration
												);
												print("NEW ID: ${next.id}");
											} else {
												next = EVignette.create(
													id: Uuid().v4(),
													start: startDate,
													area: area,
													duration: duration
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
