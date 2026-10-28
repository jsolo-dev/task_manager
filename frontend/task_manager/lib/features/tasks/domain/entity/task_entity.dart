class TaskEntity {
  String? id;
  String title;
  String? description;
  bool completed;

  TaskEntity({
    this.id,
    required this.title,
    this.description,
    required this.completed,
  });
}
