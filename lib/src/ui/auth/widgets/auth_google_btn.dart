import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class AuthGoogleBtn extends StatelessWidget {
  const AuthGoogleBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GoogleSignInButton(
      onPressed: () {},
      darkMode: true, // default: false
    ));
  }
}
