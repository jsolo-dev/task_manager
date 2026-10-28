import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';

class TaskModel {
  String? id;
  String title;
  String? description;
  bool completed;

  TaskModel({
    this.id,
    required this.title,
    this.description,
    required this.completed,
  });

  factory TaskModel.fromJson(Map<String, dynamic> data) {
    return TaskModel(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      completed: data["completed"],
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      completed: completed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "completed": completed,
    };
  }
}
