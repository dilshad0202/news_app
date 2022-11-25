import 'package:flutter/material.dart';
import 'package:news_app/src/article_model.dart';
import 'package:news_app/src/widgets/category_tiles.dart';
import 'package:news_app/src/widgets/news_sliders.dart';
import 'package:news_app/src/widgets/vertical_news.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key? key, this.articles}) : super(key: key);

  final List<Article>? articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Latest News",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "See all",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.blue,
                        size: 18,
                      )
                    ],
                  )
                ]),
          ),
          NewsSliders(articles: articles),
          CategoryTiles(),
          VerticalNews(articles: List.from(articles!.reversed))
        ],
      ),
    );
  }
}
