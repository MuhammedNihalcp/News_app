import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/screens/home/controller/home_news_controller.dart';
import 'package:news_app/screens/home/view/widget/head_line_cart.dart';
import 'package:news_app/screens/home/view/widget/logout_dialog_widget.dart';
import 'package:news_app/screens/new_details/view/new_details_view.dart';
import 'package:news_app/screens/search_screen/view/search_view.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  double height = Get.height;
  double width = Get.width;
  HomeNewsController homeNewsController = Get.put(HomeNewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttoncolor,
        title: const Text(
          'News App',
          style: TextStyle(
            color: colorBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(
              () => SearchScreen(
                height: height,
                width: width,
              ),
            );
          },
          icon: const Icon(
            Icons.search,
            color: colorBlack,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              LogoutDialog().logoutDialog(homeNewsController);
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: colorBlack,
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder(
            init: homeNewsController,
            builder: (controller) {
              return homeNewsController.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: <Widget>[
                        // Navigation Bar
                        Container(
                          height: height * 0.07,
                          color: backgroundColor,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              homeNewsController.items.length,
                              (index) => TextButton(
                                onPressed: () {
                                  homeNewsController.setFilter(
                                      homeNewsController.items[index]);
                                  homeNewsController.changeFilterIndex(index);
                                },
                                child: Text(
                                  homeNewsController.items[index],
                                  style: TextStyle(
                                    color: homeNewsController.setFilterIndex ==
                                            index
                                        ? Colors.blue
                                        : colorWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Headlines
                        HeadlineCard(
                          height: height,
                          homeNewsController: homeNewsController,
                          width: width,
                        ),
                        // Personalized Content
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext contex, int index) {
                            return homeNewsController.allNewList == null
                                ? const Center(
                                    child: Text('News is Empty'),
                                  )
                                : InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => NewsDetailsPage(
                                          id: homeNewsController
                                              .anyNewList!.data[index].id,
                                          homeNewsController:
                                              homeNewsController,
                                          height: height,
                                          width: width,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              homeNewsController.anyNewList ==
                                                      null
                                                  ? homeNewsController
                                                      .allNewList!
                                                      .data[index + 3]
                                                      .imageUrl
                                                  : homeNewsController
                                                      .anyNewList!
                                                      .data[index + 3]
                                                      .imageUrl,
                                              fit: BoxFit.cover,
                                              height: 80,
                                              width: 80,
                                            ),
                                          ),
                                          kwidth10,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  homeNewsController
                                                              .anyNewList ==
                                                          null
                                                      ? homeNewsController
                                                          .allNewList!
                                                          .data[index +3]
                                                          .title
                                                      : homeNewsController
                                                          .anyNewList!
                                                          .data[index+3]
                                                          .title,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                kheight5,
                                                Text(
                                                  homeNewsController
                                                              .anyNewList ==
                                                          null
                                                      ? homeNewsController
                                                          .allNewList!
                                                          .data[index+3]
                                                          .content
                                                      : homeNewsController
                                                          .anyNewList!
                                                          .data[index+3]
                                                          .content,
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                              ? homeNewsController.newLength - 3
                              : homeNewsController.anyNewList!.data.length- 3,
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
