import 'package:fpdart/fpdart.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';

abstract interface class Datasource {
  Future<Either<String, List<TaskEntity>>> getAllTasks();

  Future<Either<String, TaskEntity>> getTaskById(String id);

  Future<Either<String, TaskEntity>> createTask(TaskEntity task);

  Future<Either<String, TaskEntity>> updateTaskById(TaskEntity task);

  Future<Either<String, Null>> deleteTaskById(String id);
}
