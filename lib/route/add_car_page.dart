import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddCarPage extends StatefulWidget {
	AddCarPage({Key key}) : super(key: key);

	@override
	_AddCarPageState createState()=> _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
	TextEditingController textEditingControllerName = TextEditingController();
	TextEditingController textEditingControllerPrice= TextEditingController();
	TextEditingController textEditingControllerYear= TextEditingController();


	final _picker = ImagePicker();
	File file;

	final focusNode = FocusNode();


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
				  		Builder(builder: (context){
				  			if(file!=null){
				  				return Image.file(file);
								}
								return IconButton(icon: Icon(FontAwesomeIcons.image,), iconSize: 80,
									onPressed: () async {
										PickedFile pickedImage = await _picker.getImage(source: ImageSource.gallery);
										if(pickedImage != null){
											setState(() {
												file = File(pickedImage.path);
											});
										}
									});
							}),
				  		
				  		Padding(
				  		  padding: const EdgeInsets.only(top: 10),
				  		  child: TextField(
									focusNode: focusNode,
									autofocus: true,
				  		  	style: TextStyle(fontSize: 18),
				  		  	maxLines: 1,
									onTap: (){
										focusNode.requestFocus();
									},
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
