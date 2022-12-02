import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? note;
  @HiveField(2)
  DateTime? creation_date;

  @HiveField(3)
  bool? done;
  @HiveField(4)
  int? categoryId;
  @HiveField(5)
  bool? isImportant;

  HiveModel({this.creation_date, this.done, this.note, this.title,this.categoryId,this.isImportant});
}
