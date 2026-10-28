import 'package:flutter/material.dart';
import 'package:task_manager/core/util/task_data.dart';
import 'package:task_manager/features/tasks/presentation/widget/task_card.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskData.length,
      itemBuilder: (context, index) {
        return TaskCard(task: taskData.elementAt(index));
      },
    );
  }
}
