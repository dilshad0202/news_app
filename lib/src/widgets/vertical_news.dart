import 'package:flutter/material.dart';
import 'package:news_app/src/article_model.dart';
import 'package:news_app/src/widgets/news_thumbnail.dart';

class VerticalNews extends StatelessWidget {
  const VerticalNews({super.key, this.articles});

  final List<Article>? articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: articles?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:const EdgeInsets.only(left :13 ,top: 10,bottom: 10,right: 3),
          child: NewsThumbnail(article: articles?[index]));
      },
    );
  }
}