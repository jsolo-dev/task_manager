import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/usecase/usecase.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/domain/repository/task_repository.dart';

class CreateTaskUsecase
    extends Usecase<Either<String, TaskEntity>, CreateTaskParam> {
  final TaskRepository taskRepository;

  CreateTaskUsecase(this.taskRepository);

  @override
  Future<Either<String, TaskEntity>> call(CreateTaskParam param) {
    return taskRepository.createTask(param.task);
  }
}

class CreateTaskParam {
  TaskEntity task;

  CreateTaskParam(this.task);
}
