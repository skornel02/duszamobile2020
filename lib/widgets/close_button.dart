import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CloseButton extends StatelessWidget {
	@override
	Widget build(BuildContext context){
		return IconButton(icon: Icon(FontAwesomeIcons.times),
			onPressed: (){
				Navigator.pop(context);
			},
		);
	}
}
