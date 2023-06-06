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

  //all news service
  Future<NewsModel2?> getAllNews2() async {
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.all);
      // log(response.statusCode.toString(), name: 'get all status code');
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

  //science news service
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

  //business news service
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

  //sports news service
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

  //world news service
  Future<NewsModel2?> getWorldNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.world);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get world news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //india news service
  Future<NewsModel2?> getIndiaNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.india);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get India news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //politics news service
  Future<NewsModel2?> getPoliticsNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.politics);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get Politics news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //technology news service
  Future<NewsModel2?> getTechnologyNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.technology);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get technology news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //startup news service
  Future<NewsModel2?> getStartUpNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.startup);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get StartUp news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //entertainment news service
  Future<NewsModel2?> getEntertainmentNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.entertainment);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get Entertainment news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //hatke news service
  Future<NewsModel2?> getHatkeNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.hatke);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get Hatke news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //automobile news service
  Future<NewsModel2?> getAutoMobileNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.automobile);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get AutoMobile news error');
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
    }
    return null;
  }

  //miscellaneous news service
  Future<NewsModel2?> getMiscellaneousNews2() async {
    // log('sports function');
    try {
      final response = await dio.get(baseUrl.baseUrl2 + endUrl.miscellaneous);
      // log(response.statusCode.toString(), name: 'get sports status code');
      // log(response.data.toString(),name: 'sports news');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsModel2.fromJson(response.data);
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get Miscellaneous news error');
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
