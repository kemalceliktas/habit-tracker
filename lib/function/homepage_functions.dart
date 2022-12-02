import 'package:hive/hive.dart';

class HomePageFunc{
  String? catagory(int? index) {
    String? categoryName;
    if (index==0) {
      categoryName = "assets/icons/danger.png";
    }else if(index==1){
      categoryName="assets/icons/normal.png";
    }else if(index==2){
      categoryName="assets/icons/movie.png";
    }else if(index==3){
      categoryName="assets/icons/book.png";
    }

    return categoryName;
  }



  int? progressLenght(Box<dynamic> box){
    int? progresslenghth;
     progresslenghth= box.values
                      .where((element) => element.done ?? false == true)
                      .toList()
                      .length;

    return progresslenghth;
  }

  double? progressText(Box<dynamic> box){
    double? text;
   text= (box.values
                                                .where((element) =>
                                                    element.done ??
                                                    false == true)
                                                .toList()
                                                .length *
                                            100) /
                                        box.values.length;

                                        return text;
  }
}