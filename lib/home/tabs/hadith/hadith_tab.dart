import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app_colors.dart';
import '../../../model/hadith_model.dart';
import 'hadith_details_screen.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/Logo.png'),
        CarouselSlider.builder(
          itemCount: hadithList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(HadithDetailsScreen.routeName,
                  arguments: hadithList[itemIndex]);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/hadith_bg_image.png'),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: hadithList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ))
                    : Column(
                        children: [
                          Text(
                            hadithList[itemIndex].title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Text(
                            hadithList[itemIndex].content.join(''),
                            style: TextStyle(fontSize: 20),
                          ))
                        ],
                      ),
              ),
            ),
          ),
          options: CarouselOptions(
            height: 560,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString('assets/hadith_files/h$i.txt');
      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0];

      ///title
      hadithLines.removeAt(0);

      /// remove title
      HadithModel hadithModel = HadithModel(title: title, content: hadithLines);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}
