import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';

abstract class TaskEvent {}

class CreateTask extends TaskEvent {
  TaskEntity task;

  CreateTask(this.task);
}

class UpdateTask extends TaskEvent {
  TaskEntity task;

  UpdateTask(this.task);
}

class DeleteTask extends TaskEvent {
  String id;

  DeleteTask(this.id);
}
