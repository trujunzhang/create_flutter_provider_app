import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlutterLogo(
        size: 128,
      ),
    );
  }
}
