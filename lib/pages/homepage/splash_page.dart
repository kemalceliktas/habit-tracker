import 'package:flutter/material.dart';
import 'package:habit_tracker_app/data/theme_data.dart';
import 'package:habit_tracker_app/pages/homepage/home_screen.dart';
import 'package:lottie/lottie.dart';

import '../../data/durations.dart';
import '../../data/lottie_data.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(DurationTimes.duration3).then((value){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Lottie.network(LottieUrl.lottieSplashUrl,width: PageSize.screenWidth/1.5),
      ),
    );
  }
}


