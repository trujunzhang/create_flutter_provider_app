import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:ieatta/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogleBtn extends StatefulWidget {
  AuthGoogleBtn({Key key, this.isSignIn}) : super(key: key);

  final bool isSignIn;

  @override
  _AuthGoogleBtnState createState() => _AuthGoogleBtnState();
}

class _AuthGoogleBtnState extends State<AuthGoogleBtn> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.status == Status.Authenticating ||
        authProvider.status == Status.Registering) {
      return Center(
        child: null,
      );
    }
    return Container(
        color: Colors.transparent,
        height: 48,
        padding: const EdgeInsets.only(top: 8),
        child: GoogleSignInButton(
          text: widget.isSignIn ? 'Sign in with Google' : 'Sign up with Google',
          onPressed: onClick,
          darkMode: true, // default: false
        ));
  }

  onClick() {


  }
}
