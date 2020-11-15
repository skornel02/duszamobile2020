import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EVignettesPage extends StatelessWidget {
  EVignettesPage({Key key}) : super(key: key) {
    debugPrint("Created EVignettesPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(),
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
