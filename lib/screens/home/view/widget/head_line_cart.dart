import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/new_details/view/new_details_view.dart';

import '../../../../core/styles.dart';
import '../../controller/home_news_controller.dart';

class HeadlineCard extends StatelessWidget {
  const HeadlineCard({
    required this.homeNewsController,
    required this.width,
    required this.height,
    super.key,
  });
  final HomeNewsController homeNewsController;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height * 0.35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          homeNewsController.anyNewList == null ? 0 : 3,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(
                  () => NewsDetailsPage(
                    id: homeNewsController.anyNewList!.data[index].id,
                    homeNewsController: homeNewsController,
                    height: height,
                    width: width,
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      homeNewsController.anyNewList == null
                          ? homeNewsController.allNewList!.data[index].imageUrl
                          : homeNewsController.anyNewList!.data[index].imageUrl,
                      fit: BoxFit.cover,
                      height: height * 0.2,
                      width: width * 0.8,
                    ),
                  ),
                  kheight10,
                  Text(
                    homeNewsController.anyNewList == null
                        ? homeNewsController.allNewList!.data[index].author
                        : homeNewsController.anyNewList!.data[index].author,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kheight10,
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      homeNewsController.anyNewList == null
                          ? homeNewsController.allNewList!.data[index].content
                          : homeNewsController.anyNewList!.data[index].content,
                      textDirection: TextDirection.ltr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
