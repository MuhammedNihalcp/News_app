import 'new_data_model.dart';

class NewsModel {
  String category;
  List<NewsDataModel> data;
  bool success;

  NewsModel({
    required this.category,
    required this.data,
    required this.success,
  });

  factory NewsModel.fromJson(Map<dynamic, dynamic> json) => NewsModel(
        category: json["category"]?? '',
        data: List<NewsDataModel>.from(
            json["data"].map((x) => NewsDataModel.fromJson(x))),
        success: json["success"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
      };
}
