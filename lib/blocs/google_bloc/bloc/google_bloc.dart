import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  GoogleSignIn _googleSignIn;
  FirebaseAuth _auth;

  GoogleBloc() : super(GoogleReadyToLoginState()) {
    _googleSignIn = GoogleSignIn(scopes: [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/userinfo.profile",
      "openid",
      "https://www.googleapis.com/auth/drive.appdata",
      "https://www.googleapis.com/auth/drive.file"
    ]);
    _auth = FirebaseAuth.instance;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Stream<GoogleState> mapEventToState(
    GoogleEvent event,
  ) async* {
    switch (event.runtimeType) {
      case GoogleLoginButtonPressedEvent:
      case GoogleUpdateEvent:
        yield GoogleLoginWaitingState();

        try {
          print("google login: 1");
          final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

          print("google login: 2");

          if (googleUser == null) {
            print("Auth failed!!!");
            yield GoogleReadyToLoginState();
          } else {
            print("google login: 3");
            final GoogleSignInAuthentication googleAuth =
                await googleUser.authentication;

            print("google login: 4");
            final AuthCredential credential = GoogleAuthProvider.getCredential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            print("google login: 5");

            final User user =
                (await _auth.signInWithCredential(credential)).user;
            print("signed in " + user.displayName);

            final accessToken = googleAuth.accessToken;
            yield GoogleLoginSuccessfulState(
                googleUser.email, accessToken, await googleUser.authHeaders);

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool("GoogleEnabled", true);
          }
        } catch (err) {
          print("WARNING! Error while logging in: $err");
          yield GoogleReadyToLoginState();
        }

        break;
      case GoogleLogoutButtonPressedEvent:
        logout();
        yield GoogleReadyToLoginState();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("GoogleEnabled", false);

        break;
      default:
        break;
    }
  }
}
