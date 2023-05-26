import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/screens/home/controller/home_news_controller.dart';

// ignore: must_be_immutable
class NewsDetailsPage extends StatelessWidget {
  String id;
  HomeNewsController homeNewsController;
  final double height;
  final double width;

  NewsDetailsPage({
    required this.id,
    required this.homeNewsController,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var findNews = homeNewsController.findById(id);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    findNews.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      findNews.time,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight15,
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Text(
                            findNews.author[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                       kwidth10,
                        Text(
                          findNews.author,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          findNews.date,
                          // maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    Text(
                      findNews.content,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
