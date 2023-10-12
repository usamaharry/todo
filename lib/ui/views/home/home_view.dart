import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/ui/widgets/todo_item.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Mate'),
        actions: [
          IconButton(
            onPressed: viewModel.onAddNewTask,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: viewModel.todos.length,
              itemBuilder: (context, index) => TodoItem(
                todo: viewModel.todos[index],
                onDelete: viewModel.onDeleteTodo,
              ),
            ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.init());
  }
}
