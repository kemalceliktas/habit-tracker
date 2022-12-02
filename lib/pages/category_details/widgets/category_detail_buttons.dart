import 'package:flutter/material.dart';

import '../../../data/theme_data.dart';
import '../../../model/hive_model.dart';
import '../../task_editor/task_editor.dart';


class CategoryDetailButtons extends StatelessWidget {
  const CategoryDetailButtons({
    Key? key,
    required this.values,
  }) : super(key: key);

  final HiveModel values;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TaskEditor(tasks: values as HiveModel?,),
                  ),
                );
              },
              child: Icon(
                Icons.edit,
                color: ThemeColors.iconColor1
                    .withOpacity(0.8),
                size: PageSize.width20 * 1.5,
              ),
            ),
          ],
        ),
        SizedBox(
          width: PageSize.width10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                values.delete();
              },
              child: Icon(
                Icons.delete,
                color: ThemeColors.codeRed
                    .withOpacity(0.8),
                size: PageSize.width20 * 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

