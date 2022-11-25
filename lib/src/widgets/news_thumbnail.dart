import 'package:flutter/material.dart';
import 'package:news_app/src/article_model.dart';
import 'package:news_app/src/news_detail_screen.dart';
import 'package:news_app/src/styles.dart';

class NewsThumbnail extends StatelessWidget {
  const NewsThumbnail({
    Key? key,
    @required this.article,
  }) : super(key: key);

  final Article? article;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewsDetailScreen(article: article)));
            },
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                Image.network(
                  article!.urlToImage ?? "",
                  height: 200,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        article?.author ?? "",
                        style: textStyle(fontWeight: FontWeight.w900, size: 8),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(article?.title ?? "",
                          style:
                              textStyle(fontWeight: FontWeight.w900, size: 14)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.transparent,
                          Colors.black54,
                          Colors.black87
                        ])),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 3,
                    ),
                    child: Text(
                      article?.description ?? "",
                      style: textStyle(fontWeight: FontWeight.w300, size: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
