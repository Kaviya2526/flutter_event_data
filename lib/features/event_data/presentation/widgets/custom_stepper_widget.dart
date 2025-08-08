import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/usecases/stepper.dart';


class CustomStepper extends StatelessWidget {
  final int currentIndex;
  final List<StepperStatus> steps;
  final ValueChanged<int> onStepReached;

  const CustomStepper({
    super.key,
    required this.currentIndex,
    required this.steps,
    required this.onStepReached,
  });

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: currentIndex,
      steps: steps.map((step) {
        final index = steps.indexOf(step);
        final isActive = index == currentIndex;
        return EasyStep(
          customStep: _stepDot(isActive: isActive),
          customTitle: Center(
            child: Text(
              _stepLabel(step),
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: _stepTextColor(index),
              ),
            ),
          ),
        );
      }).toList(),
      onStepReached: onStepReached,
      stepRadius: 16,
      internalPadding: 16,
      showTitle: true,
      alignment: Alignment.center,
      lineStyle: const LineStyle(
        activeLineColor: AppColors.purple,
        lineLength: 64,
        lineThickness: 2,
        lineType: LineType.normal,
        finishedLineColor: AppColors.purple,
        unreachedLineColor: AppColors.lightGrey,
      ),
      showStepBorder: false,
      showLoadingAnimation: false,
    );
  }

  /// Step text color logic
  Color _stepTextColor(int index) {
    if (index == currentIndex) {
      return AppColors.purple;
    } else {
      return AppColors.stepperText;
    }
  }


  String _stepLabel(StepperStatus step) {
    switch (step) {
      case StepperStatus.eventData:
        return 'Event Data';
      case StepperStatus.guestSetup:
        return 'Guest Setup';
      case StepperStatus.itinerarySetup:
        return 'Itinerary Setup';
    }
  }

  /// Step dot design
  Widget _stepDot({required bool isActive}) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColors.purple : AppColors.lightGrey,
          width: 2,
        ),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.purple : AppColors.darkBlack,
        ),
      ),
    );
  }
}
