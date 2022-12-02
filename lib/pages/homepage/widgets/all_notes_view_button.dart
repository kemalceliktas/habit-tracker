import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/theme_data.dart';
import '../../all_notes/all_notes.dart';



class AllNotesViewButton extends StatelessWidget {
  const AllNotesViewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllNotesView()));
          },
          child: Text(
            "See all notes",
            style: GoogleFonts.encodeSans(
              fontSize: PageSize.font20 / 1.2,
              fontWeight: FontWeight.bold,
              color: ThemeColors.goldColor,
            ),
          ),
        ),
        FittedBox(
          child: Container(
            height: 2,
            width: PageSize.width20 * 5,
            color: ThemeColors.goldColor,
          ),
        ),
      ],
    );
  }
}

