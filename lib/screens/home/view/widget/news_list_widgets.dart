import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../core/styles.dart';
import '../../../new_details/view/new_details_view.dart';
import '../../controller/home_news_controller.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.homeNewsController,
    required this.height,
    required this.width,
  });

  final HomeNewsController homeNewsController;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext contex, int index) {
        return homeNewsController.allNewList == null ||
                homeNewsController.anyNewList == null
            ? const Center(
                child: Text('News is Empty'),
              )
            : InkWell(
                onTap: () {
                  Get.to(
                    () => NewsDetailsPage(
                      index: index,
                      // id: homeNewsController.anyNewList!.data[index].id,
                      homeNewsController: homeNewsController,
                      height: height,
                      width: width,
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          homeNewsController.anyNewList == null
                              ? homeNewsController
                                  .allNewList!.data[index].images
                              : homeNewsController
                                  .anyNewList!.data[index].images,
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                        ),
                      ),
                      kwidth10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              homeNewsController.anyNewList == null
                                  ? homeNewsController
                                      .allNewList!.data[index].title
                                  : homeNewsController
                                      .anyNewList!.data[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                color: colorWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            kheight5,
                            Text(
                              homeNewsController.anyNewList == null
                                  ? homeNewsController
                                      .allNewList!.data[index].decription
                                  : homeNewsController
                                      .anyNewList!.data[index].decription,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
      separatorBuilder: (BuildContext contex, int index) {
        return const SizedBox();
      },
      itemCount: homeNewsController.anyNewList == null
          ? homeNewsController.newLength
          : homeNewsController.anyNewList!.data.length,
    );
  }
}
