import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/core/constants/app_size.dart';
import 'package:task_manager/core/constants/app_spacing.dart';

class ContextMenuButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        foregroundColor: AppColor.primaryText,
        backgroundColor: AppColor.surface,
        fixedSize: Size(AppSize.xl2, AppSize.xl2),
      ),
      onPressed: () {
        showPopover(
          context: context,
          // width: AppSize.xl5,
          style: PopoverStyle(backgroundColor: AppColor.surface),
          bodyBuilder: (context) {
            return ContextMenu();
          },
        );
      },
      icon: Icon(Icons.more_vert),
    );
  }
}

class ContextMenu extends StatefulWidget {
  const ContextMenu({super.key});

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ContextMenuItem(label: "Edit", onPressed: () {}),
        ContextMenuItem(label: "Delete", onPressed: () {}),
      ],
    );
  }
}

class ContextMenuItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const ContextMenuItem({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: LinearBorder(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.lg,
        ),
        alignment: Alignment.centerLeft,
        backgroundColor: AppColor.surface,
        fixedSize: Size.fromWidth(AppSize.xl5),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
