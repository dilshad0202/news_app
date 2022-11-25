import 'package:flutter/material.dart';
import 'package:news_app/src/styles.dart';

class CategoryTiles extends StatelessWidget {
  CategoryTiles({
    Key? key,
  }) : super(key: key);

  final List<String> buttonTitles = [
    "Health",
    "Technology",
    "Arts",
    "Sports",
    "Finance",
    "Education",
    "Weather"
  ];

  ValueNotifier<int> curretIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 13),
      child: SizedBox(
          height: 40,
          child: ListView.builder(
            physics:const BouncingScrollPhysics(),
            itemCount: buttonTitles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) => ValueListenableBuilder(
                  valueListenable: curretIndex,
                  builder: ((context, value, child) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: curretIndex.value == index
                                    ? [
                                        const Color(0xffeb5354),
                                        const Color(0xfff19d9f)
                                      ]
                                    : [Colors.white, Colors.white]),
                            borderRadius: BorderRadius.circular(20)),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              curretIndex.value = index;
                            },
                            child: Text(
                              buttonTitles[index],
                              style: textStyle(
                                  color: curretIndex.value == index
                                      ? Colors.white
                                      : const Color(0xff938181),
                                  fontWeight: FontWeight.w500,
                                  size: 14),
                            )),
                      )),
                )),
          )),
    );
  }
}
