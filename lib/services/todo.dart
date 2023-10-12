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
  }

  Future<bool> addTodo({required String title}) async {
    _todos.add(
      Todo(
        id: const Uuid().v1(),
        title: title,
        isDone: false,
        dueDate: DateTime.now(),
      ),
    );

    await saveToPrefs();

    return true;
  }

  Future<bool> removeTodo(String id) async {
    _todos.removeWhere((element) => element.id == id);

    saveToPrefs();

    return true;
  }

  Future<void> saveToPrefs() async {
    await _prefService.setListOfString(
        'todos', _todos.map((e) => jsonEncode(e.toJson())).toList());
    return;
  }
}
