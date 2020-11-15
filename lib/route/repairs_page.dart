import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/repair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:duszamobile2020/widgets/listitems/repair_item.dart';

class RepairsPage extends StatelessWidget {
  final String id;

  RepairsPage(this.id, {Key key}) : super(key: key) {
    debugPrint("Created RepairsPage");
  }

  final List<Repair> repairs = [
    Repair.create(
        id: "ID",
        date: DateTime.now(),
        milage: Random().nextInt(20000),
        price: 31415135,
        reason: "",
        items: ["asd", "assgsg"],
        description: "description",
        warranty: false),
    Repair.create(
        id: "ID",
        date: DateTime.now(),
        milage: Random().nextInt(20000),
        price: 31415135,
        reason: "",
        items: ["asd", "assgsg"],
        description: "description",
        warranty: false),
    Repair.create(
        id: "ID",
        date: DateTime.now(),
        milage: Random().nextInt(20000),
        price: 31415135,
        reason: "",
        items: ["asd", "assgsg"],
        description: "description",
        warranty: false),
    Repair.create(
        id: "ID",
        date: DateTime.now(),
        milage: Random().nextInt(20000),
        price: 31415135,
        reason: "",
        items: ["asd", "assgsg"],
        description: "description",
        warranty: false),
    Repair.create(
        id: "ID",
        date: DateTime.now(),
        milage: Random().nextInt(20000),
        price: 31415135,
        reason: "",
        items: ["asd", "assgsg"],
        description: "description",
        warranty: false),
  ];

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (_) => CarBloc(
          carId: id, repo: RepositoryProvider.of<CarRepository>(context)),
      child: Scaffold(
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state){
            if(state is ReadyState){
              return Column(
                children: [
                  Container(
                    height: 200,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: repairs.length,
                      itemBuilder: (context, index) {
                        return RepairItem(repairs[index]);
                      },
                    ),
                  )
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.plus),
          onPressed: () {
            Navigator.pushNamed(context, "/cars/1/repairs/add");
          },
        ),
      ),
    );

  }
}
