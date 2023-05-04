class NewsDataModel {
  String author;
  dynamic content;
  String date;
  String id;
  String imageUrl;
  String readMoreUrl;
  String time;
  String title;
  String url;

  NewsDataModel({
    required this.author,
    required this.content,
    required this.date,
    required this.id,
    required this.imageUrl,
    required this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
        author: json["author"] ?? '',
        content: json["content"] ?? '',
        date: json["date"] ?? '',
        id: json["id"] ?? '',
        imageUrl: json["imageUrl"] ?? '',
        readMoreUrl: json["readMoreUrl"] ?? '',
        time: json["time"] ?? '',
        title: json["title"] ?? '',
        url: json["url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "date": date,
        "id": id,
        "imageUrl": imageUrl,
        "readMoreUrl": readMoreUrl,
        "time": time,
        "title": title,
        "url": url,
      };
}

// enum Date { THE_29_APR_2023_SATURDAY }
