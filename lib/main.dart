import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:habit_tracker_app/data/category_data.dart';
import 'package:habit_tracker_app/data/theme_data.dart';
import 'package:habit_tracker_app/model/hive_model.dart';
import 'package:habit_tracker_app/pages/homepage/home_screen.dart';
import 'package:habit_tracker_app/pages/homepage/splash_page.dart';
import 'package:habit_tracker_app/pages/all_notes/all_notes.dart';
import 'package:habit_tracker_app/pages/category_details/category_details_screen.dart';
import 'package:habit_tracker_app/screens/date_screen.dart';
import 'package:habit_tracker_app/pages/task_editor/task_editor.dart';
import 'package:habit_tracker_app/pages/all_notes/widgets/my_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<HiveModel>(HiveModelAdapter());
  box = await Hive.openBox<HiveModel>("tasks");
  /* box.add(
    HiveModel(
      creation_date: DateTime.now(),
      done: true,
      title: "heyy",
      note: "heyyss",
    ),
  ); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: LightThemeData.lightTheme,
      home: SplashPage(),
    );
  }
}

