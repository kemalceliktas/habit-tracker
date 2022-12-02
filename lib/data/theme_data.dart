


import 'dart:ui';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LightThemeData{
  static ThemeData lightTheme=ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color.fromARGB(255, 21, 24, 30),
    
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: ThemeColors.iconColor1,
       
      ),

    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ThemeColors.iconColor1,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
      titleSmall: TextStyle(
        color: ThemeColors.iconColor1.withOpacity(0.4),
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
        fontSize: 18,
      ),

    )
  );
}



class ThemeColors{

  static const Color mainBgColor = Color(0xff222831);
  static const Color iconColor1 = Color(0xffEEEEEE);
  static const Color iconColor2 = Color(0xff00ADB5);
  static const Color cardColor = Color(0xff393E46);
  static const Color codeGreen = Color.fromARGB(255, 62, 189, 62);
  static const Color codeRed = Color(0xffF05454);
  static const Color borderGreen = Color(0xff5FD068);
  static const Color secondBlue = Color.fromARGB(255, 119, 213, 218);
  static Color goldColor = Colors.amber.withOpacity(0.9);



}


class PageSize {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView=screenHeight/2.64;
  static double pageViewContainer=screenHeight/3.84;
  static double pageViewTextContainer=screenHeight/7.03;

  static double height10=screenHeight/84.4;
  static double height20=screenHeight/42.2;
  static double height15=screenHeight/56.27;
  static double height45=screenHeight/17.76;

  static double width10=screenHeight/84.4;
  static double width20=screenHeight/42.2;
  static double width15=screenHeight/56.27;



  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;


  static double radius20 = height20;
  static double radius30 = height15*2;

  static double iconSize24 = screenHeight/35.17;
  static double iconSize16 = screenHeight/52.75;


  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextSize = screenWidth/3.7;



  static double popularFoodImgSize = screenHeight/2.4;


  static double bottomHeightBar = screenHeight/7.03;




  

}



class GooleFontTheme{
  static  TextStyle fontWhiteBig =GoogleFonts.encodeSans(
                              fontSize: PageSize.font26,
                              color: ThemeColors.iconColor1,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold);
  static TextStyle fontGoldSmall =GoogleFonts.encodeSans(
                              fontSize: PageSize.font26 / 1.5,
                              color: ThemeColors.goldColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold);

  static TextStyle fontTimeBlue =GoogleFonts.encodeSans(
                          fontSize: PageSize.font26 / 1.5,
                          color: ThemeColors.secondBlue,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold);                            
   static TextStyle fontRed = GoogleFonts.encodeSans(
                                fontSize: PageSize.font20,
                                color: ThemeColors.codeRed,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600);
   static TextStyle helloTitle =GoogleFonts.encodeSans(
                  fontSize: PageSize.font26 / 1.5,
                  color: ThemeColors.secondBlue.withOpacity(0.5),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold);
   static TextStyle categoryTitle =GoogleFonts.encodeSans(
                          fontSize: PageSize.font20 / 1.2,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: ThemeColors.iconColor1.withOpacity(0.7),
                        );

    static TextStyle cardTitle =GoogleFonts.encodeSans(
                                  fontSize: PageSize.font20 / 1.2,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.iconColor1.withOpacity(0.8),
                                );

    static TextStyle cardNote =GoogleFonts.encodeSans(
                              fontSize: PageSize.font20 / 1.2,
                              color: ThemeColors.codeGreen.withOpacity(0.8),
                              letterSpacing: 1.5,
                            );

     static TextStyle labelText=GoogleFonts.encodeSans(
                    fontSize: PageSize.font20,
                    color: ThemeColors.iconColor1.withOpacity(0.8),
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w300,
                  );

      static TextStyle taskEditorTitle=GoogleFonts.encodeSans(
                fontSize: PageSize.font20,
                color: ThemeColors.iconColor1.withOpacity(0.8),
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              );
       static TextStyle inputText =GoogleFonts.encodeSans(
                fontSize: PageSize.font20,
                color: ThemeColors.iconColor1.withOpacity(0.8),
                letterSpacing: 1.5,
                fontWeight: FontWeight.w300,
       );                                                                                                                                                           
}




