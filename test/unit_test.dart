import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/todo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Todo App', () {
    test('saveToPrefs', () async {
      List<Todo> todos = [];
      SharedPreferences.setMockInitialValues({});
      final prefService = await SharedPreferences.getInstance();

      todos.add(
        Todo(
          id: '1',
          title: 'Read Book',
          isDone: false,
          dueDate: DateTime.now().add(
            const Duration(days: 2),
          ),
        ),
      );

      await prefService.setStringList(
          'todos', todos.map((e) => jsonEncode(e.toJson())).toList());

      todos = [];

      final list = prefService.getStringList('todos');
      todos = list!.map((e) => Todo.fromJson(jsonDecode(e))).toList();

      expect(todos[0].title, 'Read Book');
    });
  });
}
