import 'package:stacked/stacked.dart';
import 'package:todo/app/app.locator.dart';
import 'package:todo/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/services/todo.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _prefsService = locator<TodoService>();

  runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    _prefsService.fetchTodos();
    _navigationService.replaceWithHomeView();
  }
}
