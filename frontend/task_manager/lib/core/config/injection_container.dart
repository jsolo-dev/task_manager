import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:task_manager/features/tasks/data/datasource/datasource.dart";
import "package:task_manager/features/tasks/data/datasource/impl/remote_datasource.dart";
import "package:task_manager/features/tasks/data/repository/task_repository_impl.dart";
import "package:task_manager/features/tasks/domain/repository/task_repository.dart";
import "package:task_manager/features/tasks/domain/usecase/create_task_usecase.dart";
import "package:task_manager/features/tasks/domain/usecase/delete_task_by_id_usecase.dart";
import "package:task_manager/features/tasks/domain/usecase/get_all_tasks_usecase.dart";
import "package:task_manager/features/tasks/domain/usecase/get_task_by_id_usecase.dart";
import "package:task_manager/features/tasks/domain/usecase/update_task_usecase.dart";
import "package:task_manager/features/tasks/presentation/bloc/task/task_bloc.dart";
import "package:task_manager/features/tasks/presentation/bloc/tasklist/task_list_bloc.dart";

final GetIt sl = GetIt.instance;

void init() {
  sl
    ..registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: "http://localhost:8080/api/v1")),
    )
    ..registerLazySingleton<Datasource>(() => RemoteDatasource(sl()))
    ..registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl()))
    ..registerLazySingleton(() => GetTaskByIdUsecase(sl()))
    ..registerLazySingleton(() => GetAllTasksUsecase(sl()))
    ..registerLazySingleton(() => CreateTaskUsecase(sl()))
    ..registerLazySingleton(() => UpdateTaskUsecase(sl()))
    ..registerLazySingleton(() => DeleteTaskByIdUsecase(sl()))
    ..registerFactory(() => TaskListBloc(sl()))
    ..registerFactory(() => TaskBloc(sl(), sl(), sl()));
}
