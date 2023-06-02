import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/screens/home/controller/home_news_controller.dart';

import '../../../core/styles.dart';
import '../../new_details/view/new_details_view.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({
    super.key,
    required this.height,
    required this.width,
  });
  HomeNewsController homeNewsController = Get.put(HomeNewsController());
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: colorBlack,
          ),
        ),
        backgroundColor: buttoncolor,
        title: const Text(
          'Search',
          style: TextStyle(
            color: colorBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder(
            init: homeNewsController,
            builder: (controller) {
              return Column(
                children: [
                  CupertinoSearchTextField(
                    placeholder: 'Search News',
                    placeholderStyle: const TextStyle(color: colorBlack),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: colorBlack,
                    ),
                    autofocus: true,
                    prefixInsets:
                        const EdgeInsetsDirectional.fromSTEB(10, 4, 5, 3),
                    backgroundColor: const Color(0xFFF0EFFF),
                    controller: homeNewsController.searchController,
                    onChanged: (value) {
                      homeNewsController.search(value);
                    },
                  ),
                  kheight20,
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext contex, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => NewsDetailsPage(
                              id: homeNewsController.seachResult[index].id,
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
                                  homeNewsController
                                      .seachResult[index].imageUrl,
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
                                      homeNewsController
                                          .seachResult[index].title,
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
                                      homeNewsController
                                          .seachResult[index].content,
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
                    itemCount: homeNewsController.seachResult.isEmpty
                        ? 0
                        : homeNewsController.seachResult.length,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
