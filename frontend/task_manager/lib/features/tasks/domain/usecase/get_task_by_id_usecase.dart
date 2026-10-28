import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/usecase/usecase.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/domain/repository/task_repository.dart';

class GetTaskByIdUsecase
    extends Usecase<Either<String, TaskEntity>, GetTaskByIdParam> {
  final TaskRepository taskRepository;

  GetTaskByIdUsecase(this.taskRepository);

  @override
  Future<Either<String, TaskEntity>> call(GetTaskByIdParam param) {
    return taskRepository.getTaskById(param.id);
  }
}

class GetTaskByIdParam {
  String id;

  GetTaskByIdParam(this.id);
}
