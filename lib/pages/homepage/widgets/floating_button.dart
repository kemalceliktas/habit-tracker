import 'package:flutter/material.dart';

import '../../../data/theme_data.dart';
import '../../task_editor/task_editor.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        
        child: Icon(Icons.add,color: ThemeColors.mainBgColor,),
        backgroundColor: ThemeColors.goldColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskEditor(),
            ),
          );
        },
      ),
    );
  }
}