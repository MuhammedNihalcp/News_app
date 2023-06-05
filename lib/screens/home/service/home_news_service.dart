import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/common/base_url/base_url.dart';
import 'package:news_app/common/end_url/end_url.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home/model/home_news_model.dart';

import '../../../core/colors.dart';

class HomeNewsService {
  final baseUrl = ApiBaseUrl();
  final endUrl = ApiEndUrl();
  Dio dio = Dio();

  // Future<NewsModel?> getAllNews() async {
  //   try {
  //     final response = await dio.get(baseUrl.baseUrl1 + endUrl.all);
  //     log(response.statusCode.toString(), name: 'get all status code');
  //     // log(response.data.toString(), name: 'get all responce');
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return NewsModel.fromJson(response.data);
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString(), name: 'get all news error');
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       backgroundColor: colorWhite,
  //       colorText: colorRed,
  //     );
  //   }
  //   return null;
  // }

  // Future<NewsModel?> getScienceNews() async {
  //   try {
  //     final response = await dio.get(baseUrl.baseUrl1 + endUrl.science);
  //     //log(response.statusCode.toString(), name: 'get science status code');
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return NewsModel.fromJson(response.data);
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString(), name: 'get science news error');
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       backgroundColor: colorWhite,
  //       colorText: colorRed,
  //     );
  //   }
  //   return null;
  // }

  // Future<NewsModel?> getBusinessNews() async {
  //   try {
  //     final response = await dio.get(baseUrl.baseUrl1 + endUrl.business);
  //     //log(response.statusCode.toString(), name: 'get business status code');
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return NewsModel.fromJson(response.data);
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString(), name: 'get business news error');
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       backgroundColor: colorWhite,
  //       colorText: colorRed,
  //     );
  //   }
  //   return null;
  // }

  // Future<NewsModel?> getSportsNews() async {
  //   // log('sports function');
  //   try {
  //     final response = await dio.get(baseUrl.baseUrl1 + endUrl.sports);
  //     // log(response.statusCode.toString(), name: 'get sports status code');
  //     // log(response.data.toString(),name: 'sports news');
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return NewsModel.fromJson(response.data);
  //     }
  //   } on DioError catch (error) {
  //     log(error.message.toString(), name: 'get sports news error');
  //     Get.snackbar(
  //       'Error',
  //       error.toString(),
  //       backgroundColor: colorWhite,
  //       colorText: colorRed,
  //     );
  //   }
  //   return null;
  // }
  Future<NewsModel2?> getAllNews2() async {
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.all);
      log(response.statusCode.toString(), name: 'get all status code');
      // log(response.data.toString(), name: 'get all responce');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (e) {
      log(e.message.toString(), name: 'get all news error');
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  Future<NewsModel2?> getScienceNews2() async {
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.science);
      //log(response.statusCode.toString(), name: 'get science status code');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (e) {
      log(e.message.toString(), name: 'get science news error');
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  Future<NewsModel2?> getBusinessNews2() async {
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.business);
      //log(response.statusCode.toString(), name: 'get business status code');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (e) {
      log(e.message.toString(), name: 'get business news error');
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  Future<NewsModel2?> getSportsNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.sports);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get sports news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }
}
