import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/usecase/usecase.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/domain/repository/task_repository.dart';

class GetAllTasksUsecase
    extends Usecase<Either<String, List<TaskEntity>>, NoParam> {
  final TaskRepository taskRepository;

  GetAllTasksUsecase(this.taskRepository);

  @override
  Future<Either<String, List<TaskEntity>>> call(NoParam param) {
    return taskRepository.getAllTasks();
  }
}
