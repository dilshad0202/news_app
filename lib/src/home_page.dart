
import 'package:flutter/material.dart';
import 'package:news_app/src/article_model.dart';
import 'package:news_app/src/api_data_service.dart';
import 'package:news_app/src/widgets/news_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: FutureBuilder<List<Article>>(
            future: ApiService.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return NewsListView(
                  articles: snapshot.data,
                );
              }
              else if(snapshot.hasError){
                return const Center(child: Text("Soemthing Went Wrong..!"));
              }
                else if(snapshot.connectionState == ConnectionState.done && !snapshot.hasData){
                return const Center(child: Text("No Data Found..!"),);
              }
              else{
                return const  Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.black45,
                  ),
                );
              }
            }),
      ),
    );
  }
}
