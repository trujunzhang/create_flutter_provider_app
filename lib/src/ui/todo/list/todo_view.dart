import 'package:flutter/material.dart';
import 'package:ieatta/src/models/todo_model.dart';
import 'package:ieatta/src/services/firestore_database.dart';
import 'package:provider/provider.dart';

import '../../../../app/routes.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key key, this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);
    return ListTile(
      leading: Checkbox(
          value: todo.complete,
          onChanged: (value) {
            TodoModel nextTodo = TodoModel(
                id: todo.id,
                task: todo.task,
                extraNote: todo.extraNote,
                complete: value);
            firestoreDatabase.setTodo(nextTodo);
          }),
      title: Text(todo.task),
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.create_edit_todo, arguments: todo);
      },
    );
  }
}
