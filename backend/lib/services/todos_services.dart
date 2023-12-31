// memory store

import 'package:backend/models/todo.dart';
import 'package:uuid/uuid.dart';

List<Todo> todos = [];

class TodoService {
  /// get todos
  List<Todo> getTodos() {
    return todos;
  }

  /// get todo
  Todo getTodo(String id) {
    final result = todos.firstWhere((element) => (element.id == id));
    return result;
  }

  /// add todo
  Todo addTodo({required Map<String, dynamic> todo}) {
    final input = Todo(
      id: Uuid().v4(),
      title: todo['title'] as String,
      completed: todo['completed'] as bool,
    );
    todos.add(input);
    return input;
  }

  /// delete todo
  void deleteTodo({required String id}) {
    todos.removeWhere((element) => (element.id == id));
  }

  /// update todo
  Todo updateTodo({required Map<String, dynamic> todo, required String id}) {
    return todos.firstWhere((element) {
      if (element.id == id) {
        element.title = todo['title'];
        element.completed = todo['completed'];
        return true;
      } else {
        return false;
      }
    });
  }
}
