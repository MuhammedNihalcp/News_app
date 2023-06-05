import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/screens/auth/sign_in/view/sign_in_view.dart';
import 'package:news_app/screens/home/model/home_news_model.dart';
import 'package:news_app/screens/home/model/new_data_model.dart';
import 'package:news_app/screens/home/service/home_news_service.dart';

class HomeNewsController extends GetxController {
  HomeNewsController() {
    // getAllNews();
    // getBusinessNews();
    // getScienceNews();
    // getSportsNews();
    getAllNews2();
    getBusinessNews2();
    getScienceNews2();
    getSportsNews2();
  }
  bool isLoading = false;
  // NewsModel? allNewList;
  // NewsModel? scienceNewList;
  // NewsModel? businessNewList;
  // NewsModel? sportsNewList;

  // NewsModel? anyNewList;
  NewsModel2? allNewList;
  NewsModel2? scienceNewList;
  NewsModel2? businessNewList;
  NewsModel2? sportsNewList;

  NewsModel2? anyNewList;
  int newLength = 0;

  int setFilterIndex = 0;

  List<String> items = [
    'All News',
    'Science',
    'Business',
    'Sports',
    'World',
    'Sports',
    'Politics',
    'Technology',
    'Startup',
    'Entertainment',
    'Hatke',
    'Automobile',
    'Miscellaneous',
  ];

  HomeNewsService newsService = HomeNewsService();
  final auth = FirebaseAuth.instance;

  void changeFilterIndex(int index) {
    setFilterIndex = index;
    update();
  }

  // void getAllNews() async {
  //   isLoading = true;
  //   update();
  //   await newsService.getAllNews().then((value) {
  //     if (value != null) {
  //       allNewList = value;
  //       update();
  //       anyNewList = allNewList;
  //       update();
  //       newLength = allNewList!.data.length;
  //       update();
  //       isLoading = false;
  //       update();
  //     } else {
  //       isLoading = false;
  //       update();
  //       return null;
  //     }
  //   });
  // }

  // void getBusinessNews() async {
  //   isLoading = true;
  //   update();
  //   await newsService.getBusinessNews().then((value) {
  //     if (value != null) {
  //       businessNewList = value;
  //       update();
  //       isLoading = false;
  //       update();
  //     } else {
  //       isLoading = false;
  //       update();
  //       return null;
  //     }
  //   });
  // }

  // void getScienceNews() async {
  //   isLoading = true;
  //   update();
  //   await newsService.getScienceNews().then((value) {
  //     if (value != null) {
  //       scienceNewList = value;
  //       update();
  //       isLoading = false;
  //       update();
  //     } else {
  //       isLoading = false;
  //       update();
  //       return null;
  //     }
  //   });
  // }

  // void getSportsNews() async {
  //   isLoading = true;
  //   update();
  //   await newsService.getSportsNews().then((value) {
  //     if (value != null) {
  //       sportsNewList = value;
  //       update();
  //       log(sportsNewList.toString());
  //       isLoading = false;
  //       update();
  //     } else {
  //       isLoading = false;
  //       update();
  //       return null;
  //     }
  //   });
  // }

  String parseTime(DateTime date) {
    return DateFormat('kk:mm:a').format(date);
  }

  String parseDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  void getAllNews2() async {
    isLoading = true;
    update();
    await newsService.getAllNews2().then((value) {
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

  void getBusinessNews2() async {
    isLoading = true;
    update();
    await newsService.getBusinessNews2().then((value) {
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

  void getScienceNews2() async {
    isLoading = true;
    update();
    await newsService.getScienceNews2().then((value) {
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

  void getSportsNews2() async {
    isLoading = true;
    update();
    await newsService.getSportsNews2().then((value) {
      if (value != null) {
        sportsNewList = value;
        update();
        // log(sportsNewList2.toString());
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
      case 'All News':
        getAnyNews('all');
        break;
      case 'Science':
        getAnyNews('science');
        break;
      case 'Business':
        getAnyNews('business');
        break;
      case 'Sports':
        getAnyNews('sports');
        break;
    }
  }

  // NewsDataModel findById(String id) {
  //   return anyNewList!.data.firstWhere((element) => element.id == id);
  // }

  TextEditingController searchController = TextEditingController();
  List<NewsDataModel2> seachResult = [];

  void search(String keyboard) {
    List<NewsDataModel2> results = [];
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
