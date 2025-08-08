import 'package:event_data/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/common_widgets/action_button.dart';
import '../../../../core/utils/common_widgets/custom_app_bar.dart';
import '../../../../core/utils/common_widgets/custom_textfield.dart';
import '../../../../core/utils/common_widgets/date_field_widget.dart';
import '../../domain/usecases/stepper.dart';
import '../widgets/accordian_tile.dart';
import '../widgets/custom_stepper_widget.dart';
import '../widgets/event_dropdown.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  StepperStatus _currentStep = StepperStatus.eventData;
  final List<StepperStatus> _steps = StepperStatus.values;
  bool isOneDayEvent = false;
  int get currentIndex => _steps.indexOf(_currentStep);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppConstants.eventData,
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        const SizedBox(height: AppDimensions.m3),
        CustomStepper(
          currentIndex: currentIndex,
          steps: _steps,
          onStepReached: (index) {
            setState(() {
              _currentStep = _steps[index];
            });
          },
        ),
        CustomAccordionTile(
          title: AppConstants.eventData,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: AppDimensions.s10),
                child: EventNameDropdown(
                  value: AppConstants.defaultEventType,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: AppDimensions.m3),
              const CustomTextField(
                hintText: AppConstants.eventName,
                isRequired: true,
              ),
              const SizedBox(height: AppDimensions.m3),
              const Row(
                children: [
                  Expanded(
                    child: DateFieldWidget(hintText: AppConstants.startDate),
                  ),
                  SizedBox(width: AppDimensions.m2),
                  Expanded(
                    child: DateFieldWidget(hintText: AppConstants.endDate),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.s2),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOneDayEvent = !isOneDayEvent;
                      });
                    },
                    child: Container(
                      width: AppDimensions.iconM,
                      height: AppDimensions.iconM,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.text5,
                          width: AppDimensions.borderMedium,
                        ),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusS),
                      ),
                      child: isOneDayEvent
                          ? const Icon(
                              Icons.check,
                              size: AppDimensions.iconM,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.s2),
                  Text(
                    AppConstants.oneDayEvent,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColors.text2),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: AppDimensions.m3),
                child: CustomTextField(
                  hintText: AppConstants.description,
                  maxLines: 4,
                ),
              ),
              const SizedBox(height: AppDimensions.m1),
              RichText(
                text: TextSpan(
                  text: AppConstants.mainVenue,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                  children: const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.s2),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(hintText: AppConstants.nameRequired),
                  ),
                  SizedBox(width: AppDimensions.s3),
                  Expanded(
                    child:
                        CustomTextField(hintText: AppConstants.streetAddress),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.s3),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(hintText: AppConstants.cityRequired),
                  ),
                  SizedBox(width: AppDimensions.s3),
                  Expanded(
                    child: CustomTextField(hintText: AppConstants.state),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.s3),
              const CustomTextField(hintText: AppConstants.locationMapUrl),
              const SizedBox(height: AppDimensions.m2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: ActionButton(
                        label: AppConstants.cancel,
                        onPressed: () {},
                        type: ActionButtonType.outlined,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.m1),
                  Expanded(
                    child: ActionButton(
                      label: AppConstants.next,
                      onPressed: () {},
                      type: ActionButtonType.filled,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
