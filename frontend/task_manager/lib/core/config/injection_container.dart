import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:task_manager/features/tasks/data/datasource/datasource.dart";
import "package:task_manager/features/tasks/data/datasource/impl/remote_datasource.dart";
import "package:task_manager/features/tasks/data/repository/task_repository_impl.dart";
import "package:task_manager/features/tasks/domain/repository/task_repository.dart";

final GetIt sl = GetIt.instance;

void init() {
  sl
    ..registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: "http://localhost:8080/api/v1")),
    )
    ..registerLazySingleton<Datasource>(() => RemoteDatasource(sl()))
    ..registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl()));
}
