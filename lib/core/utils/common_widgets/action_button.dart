import 'package:flutter/material.dart';

import '../../../features/event_data/domain/usecases/stepper.dart';
import '../../theme/app_colors.dart';


class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ActionButtonType type;

  const ActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ActionButtonType.filled,
  });

  @override
  Widget build(BuildContext context) {
    if (type == ActionButtonType.outlined) {
      return Container(
        decoration: BoxDecoration(
          gradient: AppColors.vividGradient,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(1.5), 
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ShaderMask(
            shaderCallback: (bounds) => AppColors.vividGradient.createShader(bounds),
            blendMode: BlendMode.srcIn,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          gradient: AppColors.vividGradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
  }
}
