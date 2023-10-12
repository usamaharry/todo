import 'dart:convert';

//local
import 'package:uuid/uuid.dart';
import 'package:todo/app/app.locator.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/shared_prefs.dart';

class TodoService {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  final _prefService = locator<SharedPrefsService>();

  fetchTodos() {
    final list = _prefService.getStringList('todos');
    _todos = list.map((e) => Todo.fromJson(jsonDecode(e))).toList();
    _sort();
  }

  Future<bool> addTodo(
      {required String title, required DateTime dateTime}) async {
    _todos.add(
      Todo(
        id: const Uuid().v1(),
        title: title,
        isDone: false,
        dueDate: dateTime,
      ),
    );
    _sort();
    await _saveToPrefs();

    return true;
  }

  Future<bool> removeTodo(String id) async {
    _todos.removeWhere((element) => element.id == id);
    _sort();
    _saveToPrefs();

    return true;
  }

  Future<void> _saveToPrefs() async {
    await _prefService.setListOfString(
        'todos', _todos.map((e) => jsonEncode(e.toJson())).toList());
    return;
  }

  void _sort() {
    _todos.sort(
      (a, b) => a.dueDate.compareTo(b.dueDate),
    );
  }
}
