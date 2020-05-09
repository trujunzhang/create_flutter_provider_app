import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:ieatta/app/app_localizations.dart';
import 'package:ieatta/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthGoogleBtn extends StatefulWidget {
  AuthGoogleBtn({Key key, this.isSignIn, this.scaffoldKey}) : super(key: key);

  final bool isSignIn;
  final scaffoldKey;

  @override
  _AuthGoogleBtnState createState() => _AuthGoogleBtnState();
}

class _AuthGoogleBtnState extends State<AuthGoogleBtn> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.status == Status.Authenticating ||
        authProvider.status == Status.Registering ||
        authProvider.status == Status.GoogleAuthenticating) {
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
          onPressed: () async {
            bool status = await authProvider.signInWithGoogle();

            if (!status) {
              widget.scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text(AppLocalizations.of(context)
                    .translate("loginTxtErrorSignIn")),
              ));
            }
          },
          darkMode: true, // default: false
        ));
  }
}
