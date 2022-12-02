import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

import 'package:habit_tracker_app/data/enum_key.dart';
import 'package:habit_tracker_app/data/theme_data.dart';
import 'package:habit_tracker_app/model/hive_model.dart';
import 'package:habit_tracker_app/pages/homepage/widgets/all_notes_view_button.dart';
import 'package:habit_tracker_app/pages/homepage/widgets/categorys_widget.dart';
import 'package:habit_tracker_app/pages/homepage/widgets/floating_button.dart';
import 'package:habit_tracker_app/pages/homepage/widgets/header_all_widget.dart';

import 'package:habit_tracker_app/pages/homepage/widgets/outline_button.dart';

import 'package:habit_tracker_app/pages/homepage/widgets/search_notes_list.dart';

import 'package:hive_flutter/hive_flutter.dart';

late Box box;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isOpenSearc = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<HiveModel>>(
        valueListenable: Hive.box<HiveModel>(KeyNote.tasks.name).listenable(),
        builder: (context, box, _) {
          /*  print(box.values.where((element) => element.done??false==true).toList().length); */

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: PageSize.width20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimSearchBar(
                      autoFocus: false,
                      color: ThemeColors.iconColor1,
                      style: TextStyle(color: ThemeColors.cardColor),
                      prefixIcon: Icon(
                        Icons.search,
                        color: ThemeColors.cardColor,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: ThemeColors.cardColor,
                      ),
                      closeSearchOnSuffixTap: true,
                      width: 350,
                      textController: _searchController,
                      onSuffixTap: () {
                        setState(() {
                          isOpenSearc = true;
                        });
                      }),
                  HeaderAllWidget(box: box),
                  SizedBox(
                    height: PageSize.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AllNotesViewButton(),
                      isOpenSearc
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  isOpenSearc = !isOpenSearc;
                                  _searchController.clear();
                                });
                              },
                              child: OutlineButtonWidget())
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: PageSize.height15,
                  ),
                  isOpenSearc
                      ? SearchNotesWidget(
                          searchController: _searchController,
                          box: box,
                        )
                      : CategorysWidget()
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingButton(),
    );
  }
}
