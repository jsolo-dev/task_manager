import 'package:fpdart/fpdart.dart';
import 'package:task_manager/features/tasks/data/datasource/datasource.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Datasource datasource;

  TaskRepositoryImpl(this.datasource);

  @override
  Future<Either<String, TaskEntity>> createTask(TaskEntity task) {
    return datasource.createTask(task);
  }

  @override
  Future<Either<String, Null>> deleteTaskById(String id) {
    return datasource.deleteTaskById(id);
  }

  @override
  Future<Either<String, List<TaskEntity>>> getAllTasks() {
    return datasource.getAllTasks();
  }

  @override
  Future<Either<String, TaskEntity>> getTaskById(String id) {
    return datasource.getTaskById(id);
  }

  @override
  Future<Either<String, TaskEntity>> updateTask(TaskEntity task) {
    return datasource.updateTaskById(task);
  }
}
