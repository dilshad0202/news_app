import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/src/article_model.dart';
import 'package:news_app/src/styles.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen({super.key, this.article});

  final Article? article;
  ValueNotifier<bool> isLiked = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: isLiked,
        builder: (context, value, child) => OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: value ? const Color(0xffeb5354) : Colors.white,
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder()),
          onPressed: () {

            isLiked.value = !value;
          },
          child: Icon(
            Icons.favorite_border_rounded,
            color: value ? Colors.white : Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  article?.urlToImage ?? "",
                  height: height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 0.8,
                        color: Colors.black87,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[600],
                    child: const Center(
                      child: Icon(Icons.error_outline_rounded),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 60, bottom: 20, left: 20, right: 20),
                  width: width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 30,
                right: 30,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                      ),
                      child: Container(
                          constraints: const BoxConstraints(minHeight: 150),
                          width: width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          color: Colors.grey.withOpacity(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('EEEE, dd MMMM yyyy')
                                    .format(article?.publishedAt as DateTime)
                                    .toString(),
                                style: textStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    size: 14),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                article?.title.toString() ?? "",
                                style: textStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    size: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Published by ${article?.author ?? ""}",
                                  style: textStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      size: 12))
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(20),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      tooltip: "Back",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 15,
                      ))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              article?.content ?? "",
              style: textStyle(
                  fontWeight: FontWeight.w400, size: 18, color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
