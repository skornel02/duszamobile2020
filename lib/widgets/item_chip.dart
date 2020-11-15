import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemChip extends StatelessWidget {
	final String text;
	final int index;
	final Function onClick;

	final bool isAdd;

	ItemChip.add({this.onClick, Key key}) : index = -1, text = "", isAdd = true, super(key: key);

	ItemChip.item({this.index, this.text, this.onClick, Key key}) : isAdd = false, super(key: key);


	@override
	Widget build(BuildContext context) {
		return Container(
			color: Colors.black,
			height: 20,
			child: GestureDetector(
				onTap: isAdd ? onClick : null,
				child:  Card(
						margin: EdgeInsets.only(top: 0, bottom: 4),
						color: Colors.grey,
						shape: RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(50.0),

						),
						clipBehavior: Clip.antiAliasWithSaveLayer,
						elevation: 4,
						child: Row(
								mainAxisSize: MainAxisSize.min,
								// mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: [
									Text(text),

									if(!isAdd) GestureDetector(
										onTap: () => onClick,
										// color: Colors.red,
										child: Padding(
											padding: const EdgeInsets.only(left: 4.0),
											child: Icon(FontAwesomeIcons.solidTimesCircle, size: 20, /*color: Colors.red,*/),
										),
										//  iconSize: 20,
										// onPressed: () => widget.onCloseClick
									)



								]
						),
				),
			),
		);
	}
}


