import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/model/hive_model.dart';
import 'package:habit_tracker_app/pages/task_editor/task_editor.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../data/theme_data.dart';
import '../../../function/homepage_functions.dart';

class MyListTile extends StatefulWidget {
  MyListTile({super.key, required this.tasks, required this.index});
  HiveModel tasks;
  final int index;
  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColors.cardColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(PageSize.width20),
        /* boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ], */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //int.parse((DateTime.now().hour-widget.tasks.creation_date!.hour).toString())
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.tasks.title!.length > 10
                          ? widget.tasks.title!.toString().substring(0, 10)
                          : widget.tasks.title!,
                      style: GoogleFonts.encodeSans(
                        fontSize: PageSize.font20,
                        color: ThemeColors.iconColor1.withOpacity(0.8),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: PageSize.width10 / 1.5,
                        backgroundColor: Colors.redAccent.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: PageSize.width10 / 3,
                      ),
                      CircleAvatar(
                        radius: PageSize.width10 / 1.5,
                        backgroundColor: Colors.amber.withOpacity(0.9),
                      ),
                      SizedBox(
                        width: PageSize.width10 / 3,
                      ),
                      CircleAvatar(
                        radius: PageSize.width10 / 1.5,
                        backgroundColor: Colors.green.withOpacity(0.9),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: ThemeColors.secondBlue,
                height: 20.0,
                thickness: 1,
              ),
              Text(
                "// " + widget.tasks.note!,
                style: GoogleFonts.encodeSans(
                  fontSize: PageSize.font20 / 1.2,
                  color: ThemeColors.codeGreen.withOpacity(0.8),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TaskEditor(tasks: widget.tasks as HiveModel?,),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: ThemeColors.iconColor1.withOpacity(0.8),
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
                     widget.tasks.delete();
                    },
                    child: Icon(
                      Icons.delete,
                      color: ThemeColors.codeRed.withOpacity(0.8),
                      size: PageSize.width20 * 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
