import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/core/constants/app_size.dart';
import 'package:task_manager/features/tasks/presentation/widget/create_task_dialog.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.primaryText,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return CreateTaskDialog();
          },
        );
      },
      child: Icon(Icons.add, size: AppSize.xl2),
    );
  }
}
