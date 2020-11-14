import 'package:duszamobile2020/blocs/google_bloc/bloc/google_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/widgets/google_sync.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).user_settings),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => GoogleBloc(),
          child: Column(
            children: [
              Text("TItle"),
              Text("Egy kis leírás"),
              GoogleSync(),
            ],
          ),
        ),
      ),
    );
  }
}
