import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_app/function/homepage_functions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../data/theme_data.dart';

class ProgressBanner extends StatelessWidget {
  const ProgressBanner({
    Key? key,
    required this.box,
  }) : super(key: key);
  final Box<dynamic> box;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ThemeColors.cardColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your",
                          style: GooleFontTheme.fontGoldSmall,
                        ),
                        Text(
                          "Total Progress",
                          style: GooleFontTheme.fontWhiteBig,)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatDate(
                        DateTime.now(),
                        [d, " ", M, " ", yyyy],
                      ),
                      style: GooleFontTheme.fontTimeBlue,
                    ),
                  ],
                ),
                CircularStepProgressIndicator(
                  selectedColor: Colors.green.withOpacity(0.9),
                  child: Center(
                    child: box.values.length <= 0
                        ? Text(
                            "no task",
                            style: GooleFontTheme.fontRed,
                          )
                        : Text(
                            "%" +HomePageFunc().progressText(box)!.toStringAsFixed(0),
                            style: GooleFontTheme.fontWhiteBig,
                          ),
                  ),
                  totalSteps: box.values.length <= 0 ? 1 : box.values.length,
                  currentStep: HomePageFunc().progressLenght(box)!,
                  width: 100,
                  roundedCap: (_, isSelected) => isSelected,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
