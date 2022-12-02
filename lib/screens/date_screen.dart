import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/hive_model.dart';

late Box box;
class DateScreen extends StatefulWidget {
   DateScreen({super.key});



  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  bool isToday=true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<Box<HiveModel>>(
        valueListenable: Hive.box<HiveModel>("tasks").listenable(),
        builder: (context, box, _) {
          
          return Column(
            children: [
              Row(
                children: [
                  TextButton(onPressed: (){
                      setState(() {
                        isToday=true;
                      });
                  }, child: Text("Today"),),
                  TextButton(onPressed: (){
                    setState(() {
                      isToday=!isToday;
                    });
                  }, child: Text("Old Tasks"),),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context,index){
                    HiveModel currentTask = box.getAt(index)!;
                  
                      return ListTile(
                        
                        title:Text(isToday && currentTask.creation_date!.day == DateTime.now().day? formatDate(
                    currentTask.creation_date as DateTime,
                    [d, ",", M, ",", yyyy],
                  ):" "),
                      );
                },),
              ),
            ],
          );
      },)
    );
  }
}