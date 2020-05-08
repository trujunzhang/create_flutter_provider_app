import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class AuthGoogleBtn extends StatelessWidget {
  const AuthGoogleBtn({Key key, this.isSignIn}) : super(key: key);

  final bool isSignIn;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GoogleSignInButton(
      text: 'Sign in with Google',
      onPressed: () {},
      darkMode: true, // default: false
    ));
  }
}
