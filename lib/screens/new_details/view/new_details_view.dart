import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/screens/home/controller/home_news_controller.dart';

// ignore: must_be_immutable
class NewsDetailsPage extends StatelessWidget {
  // String id;
  int index;
  HomeNewsController homeNewsController;
  final double height;
  final double width;

  NewsDetailsPage({
    // required this.id,
    required this.index,
    required this.homeNewsController,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var findNews = homeNewsController.findById(id);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    homeNewsController.anyNewList!.data[index].images,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: colorBlack,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  // Positioned(
                  //   top: 10,
                  //   right: 10,
                  //   child: IconButton(
                  //     icon: const Icon(
                  //       Icons.share,
                  //       color: colorBlack,
                  //     ),
                  //     onPressed: () {},
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeNewsController.parseTime(
                        homeNewsController.anyNewList!.data[index].time,
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight15,
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Text(
                            homeNewsController.anyNewList!.data[index].author[0]
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        kwidth10,
                        Text(
                          homeNewsController.anyNewList!.data[index].author,
                          style: TextStyle(
                            fontSize: width * 0.045,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          homeNewsController.parseDate(
                            homeNewsController.anyNewList!.data[index].time,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: width * 0.03,
                          ),
                        ),
                      ],
                    ),
                    kheight20,
                    Text(
                      homeNewsController.anyNewList!.data[index].title,
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight5,
                    const Divider(
                      color: colorBlack,
                      thickness: 1,
                    ),
                    kheight10,
                    Text(
                      homeNewsController.anyNewList!.data[index].decription,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
