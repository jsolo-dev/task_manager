import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/features/tasks/presentation/widget/header.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(child: Column(children: [Header()])),
    );
  }
}
