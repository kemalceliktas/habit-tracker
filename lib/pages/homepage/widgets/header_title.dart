import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/theme_data.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          totalRepeatCount: 2,
          animatedTexts: [
            TypewriterAnimatedText(
              '> Hello...',
              speed: Duration(milliseconds: 100),
              textStyle: GooleFontTheme.helloTitle,
            ),
          ],
          onTap: () {},
        ),
       
        Text(
          "John Doe",
          style: GooleFontTheme.fontWhiteBig,
        )
      ],
    );
  }
}
