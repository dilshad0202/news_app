import 'package:flutter/material.dart';
import 'package:news_app/src/article_model.dart';
import 'package:news_app/src/widgets/news_thumbnail.dart';

class NewsSliders extends StatelessWidget {
  NewsSliders({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<Article>? articles;
  ValueNotifier<int> curretIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder(
          valueListenable: curretIndex,
          builder: ((context, value, child) => PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                pageSnapping: true,
                onPageChanged: (int copyIndex) {
                  curretIndex.value = copyIndex;
                },
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: articles?.length,
                itemBuilder: ((context, i) {
                  return Padding(
                      padding: EdgeInsets.all(
                        i == curretIndex.value ? 0 : 10,
                      ),
                      child: NewsThumbnail(article: articles?[i]));
                }),
              ))),
    );
  }
}
