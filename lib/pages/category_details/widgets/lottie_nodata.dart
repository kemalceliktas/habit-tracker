import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../data/lottie_data.dart';

class LottieNoData extends StatelessWidget {
  const LottieNoData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.network(
            LottieUrl.lottieNoData),
      );
  }
}