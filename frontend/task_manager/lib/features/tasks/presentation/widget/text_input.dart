import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/app_color.dart';
import 'package:task_manager/core/constants/app_radius.dart';
import 'package:task_manager/core/constants/app_size.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;
  final String? hintText;
  final int? maxLines;
  const TextInput({
    super.key,
    required this.enabled,
    this.hintText,
    this.maxLines,
    required this.controller,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  OutlineInputBorder baseBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    // borderSide: BorderSide(width: 0.2, color: AppColor.primary),
    borderRadius: BorderRadius.circular(AppRadius.xl),
  );
  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: TextSelectionThemeData(selectionColor: AppColor.primary),
      child: TextField(
        controller: widget.controller,
        cursorColor: AppColor.primary,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          disabledBorder: baseBorder,
          enabledBorder: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: BorderSide(color: AppColor.primary),
          ),
          fillColor: Color(0xFF181818),
          filled: true,
          enabled: widget.enabled,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AppColor.secondaryText),
        ),
        style: TextStyle(
          color: AppColor.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: AppSize.lg,
        ),
      ),
    );
  }
}
