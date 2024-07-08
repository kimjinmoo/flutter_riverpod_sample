import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_sample/home.dart';
import 'package:flutter_state_sample/todo_home.dart';

final helloWorldProvider = StateProvider<String>((ref) => 'Hello world');

final activityProvider = StateProvider<bool>((ref) => false);

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Column(
          children: [
            Home(),
            TodoHome()
          ],
        ),
      ),
    );
  }
}
