import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/core/constants/app_radius.dart';
import 'package:task_manager/core/constants/app_size.dart';
import 'package:task_manager/core/constants/app_spacing.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';

class TaskCard extends StatefulWidget {
  final TaskEntity task;
  const TaskCard({super.key, required this.task});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          color: AppColor.surface,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          onTap: () {},
          splashColor: AppColor.primary,
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: AppSpacing.md,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      style: TextStyle(
                        color: AppColor.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.lg + 2,
                      ),
                    ),
                    Text(
                      widget.task.description != null
                          ? widget.task.description!
                          : "",
                      style: TextStyle(
                        color: AppColor.secondaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.lg - 4,
                      ),
                    ),
                  ],
                ),
                Checkbox(
                  activeColor: AppColor.primary,
                  value: widget.task.completed,
                  onChanged: (state) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
