import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:flutter/material.dart';

class RefuelItem extends StatelessWidget {
	final Refuel refuel;

	RefuelItem(this.refuel);

	void onTap() async {

	}

	@override
	Widget build(BuildContext context) {
		return Card(
				margin: EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
				clipBehavior: Clip.antiAliasWithSaveLayer,
				elevation: 5,
				child: InkWell(
						onTap: onTap,
						child: Stack(
							children: <Widget>[
								Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Container(
													width: MediaQuery.of(context).size.width-60,
													child: Wrap(
															alignment: WrapAlignment.start,
															runSpacing: 1.4 ,
															crossAxisAlignment: WrapCrossAlignment.center,
															spacing: 2,
															children: [

															] //tagWidgets
													),
												),
											],
										),

										Text(refuel.id),

										Text(refuel.paid.toString()),

										Text(refuel.milage.toString()),

									],
								),
								Align(
									alignment: Alignment.topRight,
									child: Text(refuel.date.toString()),
								)
							],
						)
				)
		);
	}
}
