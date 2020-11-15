import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepairPage extends StatelessWidget {
  RepairPage({Key key}) : super(key: key) {
    debugPrint("Created RepairPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/cars/add");
        },
      ),
    );
  }
}
