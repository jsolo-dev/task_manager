import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/usecase/usecase.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/domain/usecase/get_all_tasks_usecase.dart';
import 'package:task_manager/features/tasks/presentation/bloc/tasklist/task_list_event.dart';
import 'package:task_manager/features/tasks/presentation/bloc/tasklist/task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final GetAllTasksUsecase getAllTasksUsecase;

  TaskListBloc(this.getAllTasksUsecase) : super(TaskListInitial()) {
    on<GetTaskList>((event, emit) async {
      emit(TaskListLoading());
      final Either<String, List<TaskEntity>> result = await getAllTasksUsecase(
        NoParam(),
      );
      result.fold(
        (message) {
          emit(TaskListError(message));
        },
        (taskList) {
          emit(TaskListLoaded(taskList));
        },
      );
    });
  }
}
