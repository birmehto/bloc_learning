import 'package:bloc_learning/todo_app/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String name) {
    final todo = Todo(name: name, createdAt: DateTime.now());

    emit([...state, todo]);
  }
}
