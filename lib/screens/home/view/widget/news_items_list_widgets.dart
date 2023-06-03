import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../controller/home_news_controller.dart';

class NewsItemsListWidget extends StatelessWidget {
  const NewsItemsListWidget({
    super.key,
    required this.height,
    required this.homeNewsController,
  });

  final double height;
  final HomeNewsController homeNewsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.07,
      color: backgroundColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          homeNewsController.items.length,
          (index) => TextButton(
            onPressed: () {
              homeNewsController.setFilter(homeNewsController.items[index]);
              homeNewsController.changeFilterIndex(index);
            },
            child: Text(
              homeNewsController.items[index],
              style: TextStyle(
                color: homeNewsController.setFilterIndex == index
                    ? buttoncolor
                    : colorWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
