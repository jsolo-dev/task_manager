import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/core/constants/app_radius.dart';
import 'package:task_manager/core/constants/app_size.dart';
import 'package:task_manager/core/constants/app_spacing.dart';
import 'package:task_manager/features/tasks/domain/entity/task_entity.dart';
import 'package:task_manager/features/tasks/presentation/widget/text_input.dart';

class TaskInfoDialog extends StatefulWidget {
  final TaskEntity task;
  const TaskInfoDialog({super.key, required this.task});

  @override
  State<TaskInfoDialog> createState() => _TaskInfoDialogState();
}

class _TaskInfoDialogState extends State<TaskInfoDialog> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(
      text: widget.task.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      backgroundColor: AppColor.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSpacing.md),
            TextInput(
              controller: titleController,
              enabled: true,
              hintText: "Title",
            ),
            SizedBox(height: AppSpacing.lg),
            TextInput(
              controller: descriptionController,
              enabled: true,
              hintText: "Description",
              maxLines: 4,
            ),
            SizedBox(height: AppSpacing.xl),
            Row(
              spacing: AppSpacing.md,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF181818),
                      foregroundColor: AppColor.primaryText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                      ),
                      fixedSize: Size.fromHeight(AppSize.xl2 + 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.lg,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      foregroundColor: AppColor.primaryText,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                      ),
                      fixedSize: Size.fromHeight(AppSize.xl2 + 20),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.lg,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
