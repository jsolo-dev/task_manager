import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';

class TaskListState {}

class TaskListInitial extends TaskListState {}

class TaskListLoading extends TaskListState {}

class TaskListLoaded extends TaskListState {
  List<TaskEntity> taskList;

  TaskListLoaded(this.taskList);
}

class TaskListError extends TaskListState {
  String message;

  TaskListError(this.message);
}
