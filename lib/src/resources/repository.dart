import 'package:aztira/src/models/todoModel0.dart';
import 'package:aztira/src/resources/todoApiProvider.dart';
import 'dart:async';

class Repository {
  final todoApiProvider = TodoApiProvider();
  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
}
