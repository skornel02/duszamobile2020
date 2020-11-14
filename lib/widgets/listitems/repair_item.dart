import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:flutter/material.dart';

class RepairItem extends StatelessWidget {
  final Repair repair;

  RepairItem(this.repair);

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
                                for (Object o in repair.items) Padding(
                                  padding: const EdgeInsets.only(top: 2, left:1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      color: Colors.red,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only( left: 6, right: 6),
                                      child: Text(o.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                    ),
                                  ),
                                )
                              ] //tagWidgets
                          ),
                        ),
                      ],
                    ),

                    Text(repair.id),

                    Text(repair.price.toString()),

                    Text(repair.milage.toString()),

                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(repair.date.toString()),
                )
              ],
            )
        )
    );
  }
}
