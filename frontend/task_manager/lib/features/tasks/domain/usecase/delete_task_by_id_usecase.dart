import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/usecase/usecase.dart';
import 'package:task_manager/features/tasks/domain/repository/task_repository.dart';

class DeleteTaskByIdUsecase
    extends Usecase<Either<String, Null>, DeleteTaskByIdParam> {
  final TaskRepository taskRepository;

  DeleteTaskByIdUsecase(this.taskRepository);

  @override
  Future<Either<String, Null>> call(DeleteTaskByIdParam param) {
    return taskRepository.deleteTaskById(param.id);
  }
}

class DeleteTaskByIdParam {
  String id;

  DeleteTaskByIdParam(this.id);
}
