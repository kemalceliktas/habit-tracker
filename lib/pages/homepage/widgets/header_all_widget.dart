import 'package:flutter/material.dart';
import 'package:habit_tracker_app/pages/homepage/widgets/progress_banner.dart';
import 'package:hive/hive.dart';

import 'header_title.dart';

class HeaderAllWidget extends StatelessWidget {
  const HeaderAllWidget({
    Key? key, required this.box,
  }) : super(key: key);
  final Box box;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTitleWidget(),
        SizedBox(
          height: 10,
        ),
        ProgressBanner(
          box: box,
        ),
      ],
    );
  }
}

