import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utils/app_style.dart';

import '../../../model/sura_model.dart';
import '../../../utils/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  // List<String> verses = [];
  String suraContentText = '';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (suraContentText.isEmpty) {
      loadSuraFile(args.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: AppStyle.bold24Primary,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_screen_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                args.suraArabicName,
                style: AppStyle.bold24Primary,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: suraContentText.isEmpty
                      ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ))
                      : SingleChildScrollView(
                          child: Text(
                            suraContentText,
                            style: AppStyle.bold20Primary,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        )
                  // ListView.builder(
                  //         itemBuilder: (context, index) {
                  //           return SuraContentItem(
                  //             content: verses[index],
                  //             index: index,
                  //           );
                  //         },
                  //         itemCount: verses.length,
                  //       ),
                  )
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString('assets/quran_files/$fileName');
    List<String> suraLines = suraContent.split('\n');

    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}] ';
    }
    suraContentText = suraLines.join();

    // verses = suraLines;
    setState(() {});
  }
}
