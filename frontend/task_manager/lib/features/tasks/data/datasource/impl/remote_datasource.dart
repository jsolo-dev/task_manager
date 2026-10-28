import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_manager/features/tasks/data/datasource/datasource.dart';
import 'package:task_manager/features/tasks/data/model/task_model.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';

class RemoteDatasource implements Datasource {
  final Dio dio;

  RemoteDatasource(this.dio);

  @override
  Future<Either<String, TaskEntity>> createTask(TaskEntity task) async {
    try {
      // TODO: data input from task entity to map if problematic
      final Map<String, dynamic> data = (await dio.post(
        "/tasks",
        data: task,
      )).data;
      return Right(TaskModel.fromJson(data).toEntity());
    } on DioException catch (error) {
      return Left(error.message!);
    }
  }

  @override
  Future<Either<String, Null>> deleteTaskById(String id) async {
    try {
      await dio.delete("/tasks/$id");
      return Right(null);
    } on DioException catch (error) {
      return Left(error.message!);
    }
  }

  @override
  Future<Either<String, List<TaskEntity>>> getAllTasks() async {
    try {
      List<dynamic> response = (await dio.get("/tasks")).data as List;
      List<Map<String, dynamic>> data = response
          .map((item) => item as Map<String, dynamic>)
          .toList();
      List<TaskModel> taskModels = data.map(TaskModel.fromJson).toList();
      List<TaskEntity> taskEntities = taskModels
          .map((taskModel) => taskModel.toEntity())
          .toList();
      return Right(taskEntities);
    } on DioException catch (error) {
      return Left(error.message!);
    }
  }

  @override
  Future<Either<String, TaskEntity>> getTaskById(String id) async {
    try {
      Map<String, dynamic> data = (await dio.get("/tasks/$id")).data;
      TaskEntity taskEntity = TaskModel.fromJson(data).toEntity();
      return Right(taskEntity);
    } on DioException catch (error) {
      return Left(error.message!);
    }
  }

  @override
  Future<Either<String, TaskEntity>> updateTaskById(TaskEntity task) async {
    try {
      Map<String, dynamic> data = (await dio.put(
        "/tasks/$task.id",
        data: task,
      )).data;
      return Right(TaskModel.fromJson(data).toEntity());
    } on DioException catch (error) {
      return Left(error.message!);
    }
  }
}
