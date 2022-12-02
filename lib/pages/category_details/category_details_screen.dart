import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/data/enum_key.dart';
import 'package:habit_tracker_app/data/lottie_data.dart';
import 'package:habit_tracker_app/data/theme_data.dart';
import 'package:habit_tracker_app/pages/category_details/widgets/category_detail_widget.dart';
import 'package:habit_tracker_app/pages/category_details/widgets/lottie_nodata.dart';
import 'package:habit_tracker_app/pages/note_detail/note_detail_page.dart';
import 'package:habit_tracker_app/pages/task_editor/task_editor.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

import '../../model/hive_model.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, required this.categoryIndex});
  final int categoryIndex;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<Box<HiveModel>>(
        valueListenable: Hive.box<HiveModel>(KeyNote.tasks.name).listenable(),
        builder: (context, box, _) {
          var valueLength=box.values
                      .where((element) =>
                          element.categoryId == widget.categoryIndex)
                      .toList()
                      .length;
          return valueLength <=
                  0
              ? LottieNoData()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: PageSize.width20),
                  child: GridView.builder(
                    itemCount: valueLength,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,mainAxisSpacing: PageSize.width10,crossAxisSpacing: PageSize.width10),
                    itemBuilder: (context, index) {
                      var values = box.values
                          .where((element) =>
                              element.categoryId == widget.categoryIndex)
                          .elementAt(index);
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteDetailPage(currentTask: values)));
                        },
                        child: CategoryDetailWidget(values: values));
                    },
                  ),
                );
        },
      ),
    );
  }
}

