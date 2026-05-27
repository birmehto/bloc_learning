import 'package:bloc_learning/todo_app/cubit/todo_cubit.dart';
import 'package:bloc_learning/todo_app/model/todo_model.dart';
import 'package:bloc_learning/todo_app/pages/add_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return Center(
            child: ListView.builder(
              padding: .all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                if (todos.isEmpty) {
                  return Center(child: Text('No Todo Found'));
                }

                return ListTile(
                  leading: Icon(Icons.task),
                  title: Text(todo.name),
                  trailing: Text(todo.createdAt.toString()),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodo()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
