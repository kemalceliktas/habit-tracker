import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../data/category_data.dart';
import '../../../data/lottie_data.dart';
import '../../../data/theme_data.dart';
import '../../category_details/category_details_screen.dart';


class CategorysWidget extends StatefulWidget {
  const CategorysWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CategorysWidget> createState() => _CategorysWidgetState();
}

class _CategorysWidgetState extends State<CategorysWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: Categorys.categorys.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: PageSize.width15,
            mainAxisSpacing: PageSize.width15),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoryDetailScreen(
                    categoryIndex:
                        Categorys.categorys.indexOf(Categorys.categorys[index]),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(PageSize.width15),
              decoration: BoxDecoration(
                color: ThemeColors.cardColor.withOpacity(0.8),
               
                borderRadius: BorderRadius.circular(PageSize.width20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: PageSize.height45 * 3,
                    width: PageSize.height45 * 4,
                    child: Lottie.network(
                      CategoryLottie()
                          .categoryLottie(Categorys.categorys[index])!,
                          repeat: false,
                      controller: _controller,
                      onLoaded: (composition) {
                        // Configure the AnimationController with the duration of the
                        // Lottie file and start the animation.
                        _controller
                          ..duration = composition.duration
                          ..repeat();
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Categorys.categorys[index].toUpperCase(),
                        style: GooleFontTheme.categoryTitle,
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
  }
}
