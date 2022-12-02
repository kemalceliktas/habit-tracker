import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/data/theme_data.dart';
import 'package:habit_tracker_app/pages/category_details/widgets/vs_code_dote.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../model/hive_model.dart';
import '../../task_editor/task_editor.dart';
import '../../note_detail/note_detail_page.dart';
import '../../../function/homepage_functions.dart';



class SearchNotesWidget extends StatefulWidget {
  const SearchNotesWidget({
    Key? key,
    required TextEditingController searchController,
    required this.box,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final Box<dynamic> box;

  @override
  State<SearchNotesWidget> createState() => _SearchNotesWidgetState();
}

class _SearchNotesWidgetState extends State<SearchNotesWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<HiveModel>>(
      valueListenable: Hive.box<HiveModel>("tasks").listenable(),
      builder: (context, box, _) {
        return Expanded(
          child: GridView.builder(
            itemCount: widget.box.values
                .where((element) =>
                    element.title!.contains(widget._searchController.text))
                .toList()
                .length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: PageSize.width15,
                mainAxisSpacing: PageSize.width15),
            itemBuilder: (context, index) {
              var searchTasks = widget.box.values
                  .where((element) =>
                      element.title!.contains(widget._searchController.text))
                  .toList();

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteDetailPage(currentTask: searchTasks[index],)));
                },
                child: Container(
                  padding: EdgeInsets.all(PageSize.width20),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                searchTasks[index].title!.length > 10
                                    ? searchTasks[index]
                                        .title!
                                        .toString()
                                        .substring(0, 10)
                                    : searchTasks[index].title!,
                                style: GooleFontTheme.cardTitle,
                              ),
                              VsCodeDotesWidgeet()
                            ],
                          ),
                          Divider(
                            color: ThemeColors.secondBlue,
                          ),
                          Text(
                            "// " + searchTasks[index].note!.toString(),
                            style: GooleFontTheme.cardNote,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            HomePageFunc().catagory(index).toString(),
                            width: PageSize.width20 * 1.5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TaskEditor(
                                      tasks: searchTasks[index] as HiveModel?),
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
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
