import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';


class DateFieldWidget extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;

  const DateFieldWidget({
    super.key,
    required this.hintText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.text3,
            ),
        suffixIcon: const Icon(
          Icons.calendar_today,
          color: AppColors.text2,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border1),
        ),
      ),
    );
  }
}
