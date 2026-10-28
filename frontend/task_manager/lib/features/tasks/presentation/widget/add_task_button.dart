import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/core/constants/app_size.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.primaryText,
      onPressed: () {},
      child: Icon(Icons.add, size: AppSize.xl2),
    );
  }
}
