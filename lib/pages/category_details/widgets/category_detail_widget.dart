import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/pages/category_details/widgets/vs_code_dote.dart';

import '../../../data/theme_data.dart';
import '../../../model/hive_model.dart';

import 'category_detail_buttons.dart';



class CategoryDetailWidget extends StatelessWidget {
  const CategoryDetailWidget({
    Key? key,
    required this.values,
  }) : super(key: key);

  final HiveModel values;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(PageSize.width15),
      decoration: BoxDecoration(
        color: ThemeColors.cardColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(PageSize.width20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                     values.title!.length > 10
                          ? values.title!.toString().substring(0, 9)+"..."
                          : values.title!,
                    style: GoogleFonts.encodeSans(
                      fontSize: PageSize.font20,
                      color: ThemeColors.iconColor1
                          .withOpacity(0.8),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  VsCodeDotesWidgeet(),
                ],
              ),
              Divider(
                color: ThemeColors.secondBlue,
                height: 20.0,
                thickness: 1,
              ),
              Text(
                "// " + values.note!,
                style: GoogleFonts.encodeSans(
                  fontSize: PageSize.font20 / 1.2,
                  color:
                      ThemeColors.codeGreen.withOpacity(0.8),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          CategoryDetailButtons(values: values),
        ],
      ),
    );
  }
}

