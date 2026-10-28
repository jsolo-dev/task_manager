import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/core/constants/app_size.dart';
import 'package:task_manager/core/constants/app_spacing.dart';
import 'package:task_manager/features/tasks/presentation/widget/context_menu_button.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Stack(
        children: [
          Align(
            child: Text(
              "Task",
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
                fontSize: AppSize.xl2,
              ),
            ),
          ),
          Align(alignment: Alignment.centerRight, child: ContextMenuButton()),
        ],
      ),
    );
  }
}
