import 'package:flutter/material.dart';
import 'package:ieatta/core/models/auth_user_model.dart';
import 'package:ieatta/core/models/todo_model.dart';
import 'package:ieatta/core/providers/auth_provider.dart';
import 'package:ieatta/core/services/firestore_database.dart';
import 'package:provider/provider.dart';

import '../../../app/app_localizations.dart';
import '../../../app/routes.dart';
import 'todos_extra_actions.dart';

class TodosAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);
    return AppBar(
      title: StreamBuilder(
          stream: authProvider.user,
          builder: (context, snapshot) {
            final AuthUserModel user = snapshot.data;
            return Text(user != null
                ? user.email +
                    " - " +
                    AppLocalizations.of(context).translate("homeAppBarTitle")
                : AppLocalizations.of(context).translate("homeAppBarTitle"));
          }),
      actions: <Widget>[
        StreamBuilder(
            stream: firestoreDatabase.todosStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TodoModel> todos = snapshot.data;
                return Visibility(
                    visible: todos.isNotEmpty ? true : false,
                    child: TodosExtraActions());
              } else {
                return Container(
                  width: 0,
                  height: 0,
                );
              }
            }),
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.setting);
            }),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  Size get preferredSize {
    return AppBar().preferredSize;
  }
}
