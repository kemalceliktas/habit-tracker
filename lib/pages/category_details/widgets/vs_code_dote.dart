import 'package:flutter/material.dart';

import '../../../data/theme_data.dart';


class VsCodeDotesWidgeet extends StatelessWidget {
  const VsCodeDotesWidgeet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: PageSize.width10 / 1.5,
          backgroundColor:
              Colors.redAccent.withOpacity(0.8),
        ),
        SizedBox(
          width: PageSize.width10 / 3,
        ),
        CircleAvatar(
          radius: PageSize.width10 / 1.5,
          backgroundColor:
              Colors.amber.withOpacity(0.9),
        ),
        SizedBox(
          width: PageSize.width10 / 3,
        ),
        CircleAvatar(
          radius: PageSize.width10 / 1.5,
          backgroundColor:
              Colors.green.withOpacity(0.9),
        ),
      ],
    );
  }
}


