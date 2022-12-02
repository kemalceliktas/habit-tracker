import 'package:flutter/material.dart';

import '../../../data/theme_data.dart';



class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: PageSize.width10,vertical: PageSize.height10),
            
            decoration: BoxDecoration(
                border: Border.all(
                    color: ThemeColors.iconColor1),
                    borderRadius: BorderRadius.circular(5),
                    ),
            child: Center(
                child: Text(
              "Cancel Search",
              style: LightThemeData
                  .lightTheme.textTheme.titleSmall!
                  .copyWith(
                      fontSize: 14,
                      color: ThemeColors.codeRed),
            )),
          ),
        ],
      );
  }
}
