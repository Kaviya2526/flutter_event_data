import 'package:event_data/core/utils/constants/app_constants.dart';
import 'package:event_data/features/event_data/presentation/screens/base/base_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';
import '../../domain/usecases/stepper.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  StepperStatus _currentStep = StepperStatus.eventData;
  final List<StepperStatus> _steps = StepperStatus.values;
  int get currentIndex => _steps.indexOf(_currentStep);
  bool _isExpanded = false;
  bool isOneDayEvent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.eventData)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            EasyStepper(
              activeStep: currentIndex,
              steps: _steps.map((step) {
                final index = _steps.indexOf(step);
                final isActive = index == currentIndex;
                return EasyStep(
                  customStep: StepDot(isActive: index == currentIndex),
                  customTitle: Text(
                    _stepLabel(step),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      color: _stepTextColor(index),
                    ),
                  ),
                );
              }).toList(),
              onStepReached: (index) {
                setState(() {
                  _currentStep = _steps[index];
                });
              },
              stepRadius: 16,
              internalPadding: 8,
              showTitle: true,
              alignment: Alignment.center,
              lineStyle: const LineStyle(
                lineLength: 64,
                lineThickness: 2,
                lineType: LineType.normal,
                finishedLineColor: AppColors.purple,
                unreachedLineColor: AppColors.lightGrey,
              ),
              showStepBorder: false,
              showLoadingAnimation: false,
            ),
            const SizedBox(height: 40),
         _buildAccordionTile(
          title: 'Event Data',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Padding(
          padding: const EdgeInsets.only(top:10),
          child: _buildWeddingDropdown(),
        ),
        const SizedBox(height: 24),
        
        // Event Name
        _buildTextField(
          hintText: 'Event Name',
          isRequired: true,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _buildDateField(hintText: 'Start Date'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildDateField(hintText: 'End Date'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        // Checkbox
       
Row(
  children: [
    GestureDetector(
      onTap: () {
        setState(() {
          isOneDayEvent = !isOneDayEvent;
        });
      },
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color:  Colors.transparent,
          border: Border.all(
            color:  AppColors.text5,
            width: 1.8,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: isOneDayEvent
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    ),
    const SizedBox(width: 8),
     Text("One Day Event",style:Theme.of(context).textTheme.labelSmall!.copyWith(color:AppColors.text2 ) ,),
    
  ],
),
 // Description Field
        Padding(
          padding: const EdgeInsets.only(top:24),
          child: _buildTextField(
            hintText: 'Description',
            maxLines: 4,
          ),
        ),
        const SizedBox(height: 16),
        
        // Main Venue
        RichText(
          text: TextSpan(
            text: "Main Venue",
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
        // MAIN VENUE FIELDS
        const SizedBox(height: 8),
        
        // Name and Street Address
        Row(
          children: [
            Expanded(
        child: _buildTextField(hintText: 'Name*'),
            ),
            const SizedBox(width: 12),
            Expanded(
        child: _buildTextField(hintText: 'Street Address'),
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        // City and State
        Row(
          children: [
            Expanded(
        child: _buildTextField(hintText: 'City*'),
            ),
            const SizedBox(width: 12),
            Expanded(
        child: _buildTextField(hintText: 'State'),
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        // Location Map URL
        _buildTextField(hintText: 'Location Map URL*'),
        
        const SizedBox(height: 20),
        
        // BUTTONS: Cancel and Save
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.deepPurple,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            foregroundColor: Colors.red,
          ),
          child: const Text("Cancel"),
        ),
            ),
            const SizedBox(width: 12),
            Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [Colors.pinkAccent, Colors.purpleAccent],
            ),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Save"),
          ),
        ),
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // ADD MORE VENUES BUTTON
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
        colors: [Colors.pinkAccent, Colors.purpleAccent],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
        Icon(Icons.add, color: Colors.white),
        SizedBox(width: 8),
        Text(
          'Add More Venues',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
            ],
          ),
        ),
        
        const SizedBox(height: 4),
        
        // Sub Text
        const Text(
          "(For Events and Guest Stay)",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        ),
        
            ],
          ),
        )
        
          
        
          ],
        ),
      ),
    );
  }
Widget _buildAccordionTile({
  required String title,
  required Widget content,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(7),
      border:  Border.all(color: AppColors.borderColor.withOpacity(0.33),width: 1),
      boxShadow:_isExpanded? null : [
        BoxShadow(
          color: Colors.black.withOpacity(0.17),
          offset: const Offset(0, 4),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _isExpanded ? AppColors.lightPink.withOpacity(0.24) :Colors.transparent,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(7),
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: [
                  _isExpanded
                      ? AppImages().expandIcon
                      : AppImages().collapseIcon,
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textBlack,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),

// placeholder to give spacing, not a line

        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.all(16.0),
            child: content,
          ),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    ),
  );
}
Widget _buildWeddingDropdown() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal:12 ),
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
      ]
   
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: "Wedding",
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
        onChanged: (value) {
        
        },
      ),
    ),
  );
}


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
Widget StepDot({required bool isActive}) {
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

Widget _buildTextField({
  required String hintText,
  int maxLines = 1,
  bool isRequired = false,
}) {
  return TextField(
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: isRequired ? '$hintText *' : hintText,
      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.text3,
          ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border1),
      ),
    ),
  );
}
Widget _buildDateField({required String hintText}) {
  return TextField(
    readOnly: true,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.text3,
          ),
      suffixIcon: Icon(
        Icons.calendar_today,
        color: AppColors.text2,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border1),
      ),
    ),
  );
}

}
