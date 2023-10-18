import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo/app/app.locator.dart';
import 'package:todo/services/todo.dart';

//local
import 'package:todo/ui/views/add_task/add_task_view.form.dart';

class AddTaskViewModel extends FormViewModel {
  final _todoService = locator<TodoService>();
  final _navigationService = locator<NavigationService>();

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  String get title => titleValue ?? '';

  void onClickSelectDate(BuildContext context) async {
    final minDate = DateTime.now().subtract(const Duration(seconds: 5));
    final maxDate = DateTime.now().add(const Duration(days: 365 * 10));

    Platform.isAndroid
        ? showDatePicker(
            context: context,
            initialDate: minDate,
            firstDate: minDate,
            lastDate: maxDate,
          ).then((value) {
            _selectedDate = value;
            rebuildUi();
          })
        : showCupertinoModalPopup(
            context: context,
            builder: (context) => SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                onDateTimeChanged: (value) {
                  _selectedDate = value;
                  rebuildUi();
                },
                initialDateTime: minDate,
                minimumDate: minDate,
                maximumDate: maxDate,
              ),
            ),
          );
  }

  void onAddNewTask() async {
    setBusy(true);
    await _todoService.addTodo(title: title, dateTime: _selectedDate!);
    _navigationService.back();
  }
}

class TitleValidators {
  static String? validateTitleText(String? value) {
    return null;
  }
}
