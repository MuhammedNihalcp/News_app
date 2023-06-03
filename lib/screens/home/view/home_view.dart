import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';

import 'package:news_app/screens/home/controller/home_news_controller.dart';
import 'package:news_app/screens/home/view/widget/head_line_cart.dart';
import 'package:news_app/screens/home/view/widget/logout_dialog_widget.dart';
import 'package:news_app/screens/home/view/widget/news_items_list_widgets.dart';
import 'package:news_app/screens/home/view/widget/news_list_widgets.dart';

import 'package:news_app/screens/search_screen/view/search_view.dart';
import 'package:news_app/util/circular_indicator_widget/circular_indicator_widget.dart';

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
          'NEWS HUB',
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
                      child: CircularIndicatorWidget(),
                    )
                  : ListView(
                      children: <Widget>[
                        // News Items Bar
                        NewsItemsListWidget(
                          height: height,
                          homeNewsController: homeNewsController,
                        ),

                        // Headlines
                        HeadlineCard(
                          height: height,
                          homeNewsController: homeNewsController,
                          width: width,
                        ),
                        // Personalized Content
                        NewsList(
                          homeNewsController: homeNewsController,
                          height: height,
                          width: width,
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
