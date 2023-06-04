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

class NewsDataModel2 {
  String author;
  dynamic decription;
  String images;
  String readmoreurl;
  String time;
  String title;
  String inshortslink;

  NewsDataModel2({
    required this.author,
    required this.decription,
    required this.images,
    required this.readmoreurl,
    required this.time,
    required this.title,
    required this.inshortslink,
  });

  factory NewsDataModel2.fromJson(Map<String, dynamic> json) => NewsDataModel2(
        author: json["author"] ?? '',
        decription: json["decription"] ?? '',
        images: json["images"] ?? '',
        readmoreurl: json["read-more"] ?? '',
        time: json["time"] ?? '',
        title: json["title"] ?? '',
        inshortslink: json["inshorts-link"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "decription": decription,
        "images": images,
        "read-more": readmoreurl,
        "time": time,
        "title": title,
        "inshorts-link": inshortslink,
      };
}
