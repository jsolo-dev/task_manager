import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  TaskEntity task;

  TaskLoaded(this.task);
}

class TaskError extends TaskState {
  String message;

  TaskError(this.message);
}

class TaskUpdated extends TaskState {}

class TaskCreated extends TaskState {}

class TaskDeleted extends TaskState {}
