import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final Car car;

  CarItem({this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          print("Opening car #${car.id}");
          Navigator.pushNamed(context, "/cars/${car.id}");
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            car.name,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
