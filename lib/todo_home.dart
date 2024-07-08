import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_sample/todo.dart';
import 'package:flutter_state_sample/todo_provider.dart';

class TodoHome extends ConsumerStatefulWidget {
  const TodoHome({super.key});

  ConsumerState<ConsumerStatefulWidget> createState() => _TodoHomeState();
}

class _TodoHomeState extends ConsumerState<TodoHome> {
  Future<void>? _pendingAddTodo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _pendingAddTodo,
        builder: (context, snapshot) {
          final isErrored = snapshot.hasError &&
              snapshot.connectionState == ConnectionState.waiting;

          log("isErrored : ${isErrored}");

          return Row(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    // 오류가 있는 경우 버튼이 빨간색으로 표시됩니다.
                    backgroundColor: WidgetStatePropertyAll(
                      isErrored ? Colors.red : null,
                    ),
                  ),
                  onPressed: () {
                    final future = ref
                        .read(todoListNotifierProvider.notifier)
                        .addTodo(Todo(description: "test", completed: false));
                    setState(() {
                      _pendingAddTodo = future;
                    });
                  },
                  child: const Text('Add todo')),
              if (snapshot.connectionState == ConnectionState.waiting) ...[
                const SizedBox(width: 8),
                const CircularProgressIndicator(),
              ]
            ],
          );
        });
  }
}
