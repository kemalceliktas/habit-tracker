import 'package:flutter/material.dart';
import 'package:habit_tracker_app/data/enum_key.dart';
import 'package:habit_tracker_app/data/lottie_data.dart';
import 'package:habit_tracker_app/data/theme_data.dart';
import 'package:habit_tracker_app/model/hive_model.dart';
import 'package:habit_tracker_app/pages/note_detail/note_detail_page.dart';
import 'package:habit_tracker_app/screens/date_screen.dart';
import 'package:habit_tracker_app/pages/all_notes/widgets/my_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';



class AllNotesView extends StatefulWidget {
  const AllNotesView({super.key});

  @override
  State<AllNotesView> createState() => _AllNotesViewState();
}

class _AllNotesViewState extends State<AllNotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<Box<HiveModel>>(
        valueListenable: Hive.box<HiveModel>(KeyNote.tasks.name).listenable(),
        builder: (context, box, _) {
          
          return box.values.length<=0 ? Center(child:
                Lottie.network(LottieUrl.lottieNoData),
                ): Padding(
            padding:  EdgeInsets.symmetric(horizontal: PageSize.width20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: PageSize.width10/2,crossAxisSpacing: PageSize.width15),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                HiveModel currentTask = box.getAt(index)!;
                return  InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteDetailPage(currentTask: currentTask)));
                  },
                  child: MyListTile(
                    tasks: currentTask,
                    index: index,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
