import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final bool isRequired;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: isRequired ? '$hintText *' : hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.text3,
            ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border1),
        ),
      ),
    );
  }
}
