import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/domain/usecase/create_task_usecase.dart';
import 'package:task_manager/features/tasks/domain/usecase/delete_task_by_id_usecase.dart';
import 'package:task_manager/features/tasks/domain/usecase/update_task_usecase.dart';
import 'package:task_manager/features/tasks/presentation/bloc/task/task_event.dart';
import 'package:task_manager/features/tasks/presentation/bloc/task/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTaskUsecase createTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  final DeleteTaskByIdUsecase deleteTaskByIdUsecase;

  TaskBloc(
    this.createTaskUsecase,
    this.updateTaskUsecase,
    this.deleteTaskByIdUsecase,
  ) : super(TaskInitial()) {
    on<CreateTask>((event, emit) async {
      final Either<String, TaskEntity> result = await createTaskUsecase(
        CreateTaskParam(event.task),
      );
      result.fold(
        (message) {
          emit(TaskError(message));
        },
        (task) {
          emit(TaskCreated());
        },
      );
    });

    on<UpdateTask>((event, emit) async {
      final Either<String, TaskEntity> result = await updateTaskUsecase(
        UpdateTaskParam(event.task),
      );
      result.fold(
        (message) {
          emit(TaskError(message));
        },
        (task) {
          emit(TaskUpdated());
        },
      );
    });

    on<DeleteTask>((event, emit) async {
      Either<String, Null> result = await deleteTaskByIdUsecase(
        DeleteTaskByIdParam(event.id),
      );
      result.fold(
        (message) {
          emit(TaskError(message));
        },
        (_) {
          emit(TaskDeleted());
        },
      );
    });
  }
}
