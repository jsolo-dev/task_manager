import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/usecase/usecase.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/domain/repository/task_repository.dart';

class UpdateTaskUsecase
    extends Usecase<Either<String, TaskEntity>, UpdateTaskParam> {
  final TaskRepository taskRepository;

  UpdateTaskUsecase(this.taskRepository);

  @override
  Future<Either<String, TaskEntity>> call(UpdateTaskParam param) {
    return taskRepository.updateTask(param.task);
  }
}

class UpdateTaskParam {
  TaskEntity task;

  UpdateTaskParam(this.task);
}
