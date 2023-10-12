import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:intl/intl.dart';

//local
import 'add_task_viewmodel.dart';
import 'package:todo/ui/views/add_task/add_task_view.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'title',
    validator: TitleValidators.validateTitleText,
  ),
])
class AddTaskView extends StackedView<AddTaskViewModel> with $AddTaskView {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Task',
        ),
      ),
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: titleController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (viewModel.hasTitleValidationMessage)
                    Text(
                      viewModel.titleValidationMessage!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () => viewModel.onClickSelectDate(context),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          viewModel.selectedDate == null
                              ? 'Select Date'
                              : '${DateFormat(DateFormat.HOUR_MINUTE).format(viewModel.selectedDate!)} ${DateFormat.yMMMEd().format(viewModel.selectedDate!)}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: viewModel.titleValue!.isNotEmpty &&
                              viewModel.selectedDate != null
                          ? viewModel.onAddNewTask
                          : null,
                      child: const Text('Add'),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  @override
  AddTaskViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddTaskViewModel();

  @override
  void onViewModelReady(AddTaskViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(AddTaskViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
