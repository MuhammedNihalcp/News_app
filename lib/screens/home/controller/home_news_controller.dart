import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/auth/sign_in/view/sign_in_view.dart';
import 'package:news_app/screens/home/model/home_news_model.dart';
import 'package:news_app/screens/home/model/new_data_model.dart';
import 'package:news_app/screens/home/service/home_news_service.dart';

class HomeNewsController extends GetxController {
  HomeNewsController() {
    getAllNews();
    getBusinessNews();
    getScienceNews();
    getSportsNews();
  }
  bool isLoading = false;
  NewsModel? allNewList;
  NewsModel? scienceNewList;
  NewsModel? businessNewList;
  NewsModel? sportsNewList;

  NewsModel? anyNewList;
  int newLength = 0;

  int setFilterIndex = 0;

  List<String> items = [
    'All News',
    'Science News',
    'Business News',
    'Sports News',
  ];

  HomeNewsService newsService = HomeNewsService();
  final auth = FirebaseAuth.instance;

  void changeFilterIndex(int index) {
    setFilterIndex = index;
    update();
  }

  void getAllNews() async {
    isLoading = true;
    update();
    await newsService.getAllNews().then((value) {
      if (value != null) {
        allNewList = value;
        update();
        anyNewList = allNewList;
        update();
        newLength = allNewList!.data.length;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
  }

  void getBusinessNews() async {
    isLoading = true;
    update();
    await newsService.getBusinessNews().then((value) {
      if (value != null) {
        businessNewList = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
  }

  void getScienceNews() async {
    isLoading = true;
    update();
    await newsService.getScienceNews().then((value) {
      if (value != null) {
        scienceNewList = value;
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
  }

  void getSportsNews() async {
    isLoading = true;
    update();
    await newsService.getSportsNews().then((value) {
      if (value != null) {
        sportsNewList = value;
        update();
        log(sportsNewList.toString());
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
  }

  void getAnyNews(String category) async {
    isLoading = true;
    update();
    if (category == 'all') {
      anyNewList = allNewList;
      update();
    } else if (category == 'business') {
      anyNewList = businessNewList;
      update();
    } else if (category == 'science') {
      anyNewList = scienceNewList;
      update();
    } else {
      anyNewList = sportsNewList;
      update();
    }
    isLoading = false;
    update();
  }

  setFilter(var selection) async {
    switch (selection) {
      case 'All':
        getAnyNews(allNewList!.category);
        break;
      case 'Science News':
        getAnyNews(scienceNewList!.category);
        break;
      case 'Business News':
        getAnyNews(businessNewList!.category);
        break;
      case 'Sports News':
        getAnyNews(sportsNewList!.category);
        break;
    }
  }

  NewsDataModel findById(String id) {
    return anyNewList!.data.firstWhere((element) => element.id == id);
  }

  TextEditingController searchController = TextEditingController();
  List<NewsDataModel> seachResult = [];

  void search(String keyboard) {
    List<NewsDataModel> results = [];
    if (keyboard.isEmpty) {
      results = anyNewList!.data;
      update();
    } else {
      results = anyNewList!.data
          .where(
            (element) => element.title.toLowerCase().contains(
                  keyboard.toLowerCase(),
                ),
          )
          .toList();
      update();
    }

    seachResult = results;
    update();
  }

  void signout() {
    auth.signOut();
    Get.offAll(() => ScreenSignIn());
  }
}
