import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/data/category_data.dart';
import 'package:habit_tracker_app/model/hive_model.dart';
import 'package:habit_tracker_app/function/homepage_functions.dart';
import 'package:habit_tracker_app/pages/category_details/widgets/vs_code_dote.dart';

import '../../data/theme_data.dart';

class NoteDetailPage extends StatelessWidget {
  const NoteDetailPage({super.key, required this.currentTask});
  final HiveModel currentTask;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageSize.width20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentTask.title!,
                            style: GooleFontTheme.fontWhiteBig,
                          ),
                          Text(
                            formatDate(
                              currentTask.creation_date!,
                              [d, " ", M, " ", yyyy],
                            ),
                            style: GooleFontTheme.fontTimeBlue,
                          )
                        ],
                      ),
                      Image.asset(
                        HomePageFunc()
                            .catagory(currentTask.categoryId)
                            .toString(),
                        width: PageSize.width20 * 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: PageSize.height20,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeColors.cardColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(PageSize.width20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(PageSize.width15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          VsCodeDotesWidgeet()
                        ],
                      ),
                      Text(
                        "> " + currentTask.note!,
                        style: GooleFontTheme.cardNote,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
