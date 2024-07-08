import 'dart:convert';

import 'package:flutter_state_sample/todo.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() async {
    return [
      Todo(description: 'Buy', completed: true),
      Todo(description: 'Sleep', completed: false),
    ];
  }

  Future<void> addTodo(Todo todo) async {
    await http.post(Uri.https('naver.com', '/todos'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todo.toJson()));

    final previousState = await future;

    state = AsyncData([...previousState, todo]);
  }
}
