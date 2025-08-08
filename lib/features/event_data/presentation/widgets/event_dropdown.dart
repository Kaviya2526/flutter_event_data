import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class EventNameDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const EventNameDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.borderColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.24),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 13,
                color: AppColors.textBlack,
              ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: const [
            DropdownMenuItem(value: "Wedding", child: Text("Wedding")),
            DropdownMenuItem(value: "Birthday", child: Text("Birthday")),
            DropdownMenuItem(value: "Conference", child: Text("Conference")),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
