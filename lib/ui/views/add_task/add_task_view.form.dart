// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/ui/views/add_task/add_task_viewmodel.dart';

const bool _autoTextFieldValidation = true;

const String TitleValueKey = 'title';

final Map<String, TextEditingController> _AddTaskViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddTaskViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddTaskViewTextValidations = {
  TitleValueKey: TitleValidators.validateTitleText,
};

mixin $AddTaskView {
  TextEditingController get titleController =>
      _getFormTextEditingController(TitleValueKey);

  FocusNode get titleFocusNode => _getFormFocusNode(TitleValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddTaskViewTextEditingControllers.containsKey(key)) {
      return _AddTaskViewTextEditingControllers[key]!;
    }

    _AddTaskViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddTaskViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddTaskViewFocusNodes.containsKey(key)) {
      return _AddTaskViewFocusNodes[key]!;
    }
    _AddTaskViewFocusNodes[key] = FocusNode();
    return _AddTaskViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    titleController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    titleController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TitleValueKey: titleController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddTaskViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddTaskViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddTaskViewTextEditingControllers.clear();
    _AddTaskViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get titleValue => this.formValueMap[TitleValueKey] as String?;

  set titleValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TitleValueKey: value}),
    );

    if (_AddTaskViewTextEditingControllers.containsKey(TitleValueKey)) {
      _AddTaskViewTextEditingControllers[TitleValueKey]?.text = value ?? '';
    }
  }

  bool get hasTitle =>
      this.formValueMap.containsKey(TitleValueKey) &&
      (titleValue?.isNotEmpty ?? false);

  bool get hasTitleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey]?.isNotEmpty ?? false;

  String? get titleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey];
}

extension Methods on FormStateHelper {
  setTitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    titleValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TitleValueKey: getValidationMessage(TitleValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddTaskViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddTaskViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TitleValueKey: getValidationMessage(TitleValueKey),
    });
