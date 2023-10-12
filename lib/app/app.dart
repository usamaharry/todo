import 'package:todo/services/shared_prefs.dart';
import 'package:todo/services/todo.dart';
import 'package:todo/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:todo/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/ui/views/home/home_view.dart';
import 'package:todo/ui/views/add_task/add_task_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AddTaskView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TodoService),
    InitializableSingleton(classType: SharedPrefsService),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
