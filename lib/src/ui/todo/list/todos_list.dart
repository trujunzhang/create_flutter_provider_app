import 'package:flutter/material.dart';
import 'package:ieatta/core/models/todo_model.dart';
import 'package:ieatta/core/services/firestore_database.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_localizations.dart';
import 'todo_view.dart';

class TodosList extends StatelessWidget {
  const TodosList({Key key, this.todos, this.scaffoldKey}) : super(key: key);

  final scaffoldKey;
  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);
    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        TodoModel todo = todos[index];
        return Dismissible(
            background: Container(
              color: Colors.red,
              child: Center(
                  child: Text(
                AppLocalizations.of(context)
                    .translate("todosDismissibleMsgTxt"),
                style: TextStyle(color: Theme.of(context).canvasColor),
              )),
            ),
            key: Key(todo.id),
            onDismissed: (direction) {
              firestoreDatabase.deleteTodo(todo);

              scaffoldKey.currentState.showSnackBar(SnackBar(
                backgroundColor: Theme.of(context).appBarTheme.color,
                content: Text(
                  AppLocalizations.of(context)
                          .translate("todosSnackBarContent") +
                      todo.task,
                  style: TextStyle(color: Theme.of(context).canvasColor),
                ),
                duration: Duration(seconds: 3),
                action: SnackBarAction(
                  label: AppLocalizations.of(context)
                      .translate("todosSnackBarActionLbl"),
                  textColor: Theme.of(context).canvasColor,
                  onPressed: () {
                    firestoreDatabase.setTodo(todo);
                  },
                ),
              ));
            },
            child: TodoView(
              todo: todo,
            ));
      },
      separatorBuilder: (context, index) {
        return Divider(height: 0.5);
      },
    );
  }
}
