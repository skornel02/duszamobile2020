import 'package:duszamobile2020/blocs/google_bloc/bloc/google_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/provider/google_provider.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class GoogleSync extends StatefulWidget {
  @override
  _GoogleSyncState createState() => _GoogleSyncState();
}

class _GoogleSyncState extends State<GoogleSync> {
  void _synchronize(DateTime local, DateTime remote,
      CarRepository carRepository, GoogleCarProvider googleProvider) async {
    print("Local: $local Remote: $remote");
    if (local.isBefore(remote)) {
      print("Local is behind remote...");
      await carRepository.updateCacheAndSave(await googleProvider.loadCars());
    } else {
      print("Remote is behind local...");
      await googleProvider.saveCars(await carRepository.getCars());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleBloc, GoogleState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case GoogleReadyToLoginState:
            return Container(
              child: SignInButton(
                Buttons.Google,
                onPressed: () {
                  BlocProvider.of<GoogleBloc>(context)
                      .add(GoogleLoginButtonPressedEvent());
                },
              ),
            );
          case GoogleLoginWaitingState:
            return Container(
              child: Text("Loading"),
            );
          case GoogleLoginSuccessfulState:
            GoogleLoginSuccessfulState successState = state;
            CarRepository carRepository =
                RepositoryProvider.of<CarRepository>(context);
            GoogleCarProvider googleProvider =
                GoogleCarProvider(successState.accessToken);

            final localModified = carRepository.lastModified();
            final remoteModified = googleProvider.lastModified();
            final bothModified = Future.wait(
                <Future>[]..add(localModified)..add(remoteModified));

            return Column(children: [
              Text('Logged in as: ${successState.email}'),
              FutureBuilder(
                future: localModified,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      var time = DateFormat(S.of(context).time_format)
                          .format(snapshot.data);
                      return Text(S
                          .of(context)
                          .last_change(S.of(context).local_area, time));
                  }
                },
              ),
              FutureBuilder(
                future: remoteModified,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      var time = DateFormat(S.of(context).time_format)
                          .format(snapshot.data.add(Duration(hours: 1)));
                      return Text(S
                          .of(context)
                          .last_change(S.of(context).remote_area, time));
                  }
                },
              ),
              FutureBuilder(
                future: bothModified,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      DateTime local = snapshot.data[0];
                      DateTime remote = snapshot.data[1];
                      return IconButton(
                        icon: Icon(FontAwesomeIcons.sync),
                        color: Colors.blue,
                        onPressed: () => _synchronize(
                            local, remote, carRepository, googleProvider),
                      );
                  }
                },
              )
            ]);
        }
      },
    );
  }
}
