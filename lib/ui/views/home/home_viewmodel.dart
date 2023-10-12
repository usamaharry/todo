import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

//local
import 'package:todo/app/app.locator.dart';
import 'package:todo/app/app.router.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/services/todo.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _todoService = locator<TodoService>();
  final _dialogService = locator<DialogService>();

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void init() async {
    setBusy(true);
    _todos = _todoService.todos;
    setBusy(false);
  }

  void onDeleteTodo(String id) async {
    _dialogService
        .showConfirmationDialog(title: 'Are you sure to delete?')
        .then((value) {
      if (value!.confirmed) {
        setBusy(true);
        _todoService.removeTodo(id);
        setBusy(false);
      }
    });
  }

  void onAddNewTask() =>
      _navigationService.navigateToAddTaskView().then((value) {
        init();
      });
}
