import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/data/category_data.dart';
import 'package:habit_tracker_app/data/theme_data.dart';
import 'package:habit_tracker_app/model/hive_model.dart';
import 'package:hive/hive.dart';
import '../homepage/home_screen.dart';

class TaskEditor extends StatefulWidget {
  TaskEditor({super.key, this.tasks, this.currentCategory});

  HiveModel? tasks;
  int? currentCategory;
  @override
  State<TaskEditor> createState() => _TaskEditorState();
}

class _TaskEditorState extends State<TaskEditor> {
  late bool isDone = false;
  int? itemCategory;
  late bool isGreen = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController _taskTitle = TextEditingController(
        text: widget.tasks == null ? null : widget.tasks!.title);
    TextEditingController _taskNote = TextEditingController(
        text: widget.tasks == null ? null : widget.tasks!.note);

    TextEditingController _taskCategoryId = TextEditingController(
        text:
            widget.tasks == null ? null : widget.tasks!.categoryId.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PageSize.width20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                menuProps: MenuProps(
                    elevation: 16,
                    backgroundColor: ThemeColors.cardColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(PageSize.width20),
                        topRight: Radius.circular(PageSize.width20))),
                showSelectedItems: true,
              ),
              items: Categorys.categorys,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  suffixIconColor: ThemeColors.iconColor1,
                  fillColor: ThemeColors.cardColor.withOpacity(0.8),
                  iconColor: ThemeColors.iconColor1,
                  labelText: "Select Category",
                  prefixIconColor: ThemeColors.iconColor1,
                  labelStyle: GooleFontTheme.labelText,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  itemCategory = Categorys.categorys.indexOf(value.toString());
                  print(itemCategory);
                });
              },
            ),
            SizedBox(
              height: PageSize.height20 * 1.5,
            ),
            Text(
              "Your Task's Title",
              style: GooleFontTheme.taskEditorTitle
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              style: GooleFontTheme.inputText,
              controller: _taskTitle,
              decoration: InputDecoration(
                  fillColor: ThemeColors.cardColor.withOpacity(0.7),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Your title...",
                  hintStyle: GooleFontTheme.labelText),
            ),
            SizedBox(
              height: PageSize.height20 * 1.5,
            ),
            Text(
              "Your Note",
              style: GooleFontTheme.taskEditorTitle,
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              style: GooleFontTheme.inputText,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 20,
              controller: _taskNote,
              decoration: InputDecoration(
                fillColor: ThemeColors.cardColor.withOpacity(0.7),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Your note...",
                hintStyle: GoogleFonts.encodeSans(
                  fontSize: PageSize.font20,
                  color: ThemeColors.iconColor1.withOpacity(0.5),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: PageSize.height20,
            ),
            widget.tasks == null
                ? SizedBox()
                : RawMaterialButton(
                    padding: EdgeInsets.all(PageSize.width15),
                    onPressed: () {
                      setState(() {
                        isDone = !isDone;
                        print(isDone);
                      });
                    },
                    fillColor: ThemeColors.codeGreen.withOpacity(0.5),
                    child: Text(
                      "Done your task",
                      style: GooleFontTheme.categoryTitle,
                    ),
                  ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: RawMaterialButton(
                    onPressed: () async {
                      var newTask = HiveModel(
                        title: _taskTitle.text,
                        note: _taskNote.text,
                        creation_date: DateTime.now(),
                        done: isDone,
                        categoryId: itemCategory,
                      );

                      Box<HiveModel> taskBox = Hive.box<HiveModel>("tasks");

                      if (widget.tasks != null) {
                        widget.tasks!.title = newTask.title;
                        widget.tasks!.note = newTask.note;
                        widget.tasks!.done = newTask.done;

                        widget.tasks!.save();
                        print(newTask.done);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        await taskBox.add(newTask);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    fillColor: ThemeColors.goldColor,
                    child: Text(
                      widget.tasks == null ? "Add new task" : "Update Task",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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
