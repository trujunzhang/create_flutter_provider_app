import 'package:flutter/material.dart';
import 'package:ieatta/app_localizations.dart';
import 'package:ieatta/routes.dart';
import 'package:ieatta/src/models/todo_model.dart';
import 'package:ieatta/src/providers/auth_provider.dart';
import 'package:ieatta/src/services/firestore_database.dart';
import 'package:ieatta/src/ui/todo/empty_content.dart';
import 'package:provider/provider.dart';

import 'list/todos_list.dart';
import 'todos_app_bar.dart';

class TodosScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TodosAppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.create_edit_todo,
          );
        },
      ),
      body: WillPopScope(
          onWillPop: () async => false, child: _buildBodySection(context)),
    );
  }

  Widget _buildBodySection(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
        stream: firestoreDatabase.todosStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TodoModel> todos = snapshot.data;
            if (todos.isNotEmpty) {
              return TodosList(todos: todos, scaffoldKey: _scaffoldKey);
            } else {
              return EmptyContentWidget(
                title: AppLocalizations.of(context)
                    .translate("todosEmptyTopMsgDefaultTxt"),
                message: AppLocalizations.of(context)
                    .translate("todosEmptyBottomDefaultMsgTxt"),
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title:
                  AppLocalizations.of(context).translate("todosErrorTopMsgTxt"),
              message: AppLocalizations.of(context)
                  .translate("todosErrorBottomMsgTxt"),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
