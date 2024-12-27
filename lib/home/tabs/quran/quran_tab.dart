import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/sura_model.dart';
import '../../../utils/app_colors.dart';
import 'sura_list_widget.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
        suraEnglishName: SuraModel.suraEnglishList[i],
        suraArabicName: SuraModel.suraArabicList[i],
        numOfVerses: SuraModel.numberOfVersesList[i],
        fileName: '${i + 1}.txt',
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState     execute  before build function
    super.initState();
    addSuraList();
    loadLastSura(); // get data from shared preference
  }

  List<SuraModel> filterList = SuraModel.suraList;
  String searchtext = '';
  List<SuraModel> searchResultText = [];
  Map<String, String> loadSuraList = {};

  /*
  suraList => List => 114
  filterList =114
  suraList => 114 => filter => searchText =>filterList
   */

  @override
  Widget build(BuildContext context) {
    loadLastSura();
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/Logo.png'),
          TextField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )),
              prefixIcon: const ImageIcon(
                AssetImage('assets/images/icon _search.png'),
                color: AppColors.primaryDark,
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyle.bold16White,
            ),
            onChanged: (text) {
              searchtext = text;
              filterList = SuraModel.suraList.where((suraModel) {
                return suraModel.suraArabicName.contains(searchtext) ||
                    suraModel.suraEnglishName
                        .toLowerCase()
                        .contains(searchtext.toLowerCase());
              }).toList();

              setState(() {});
              // for(SuraModel data in SuraModel.suraList){
              //
              // }
            },
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          searchtext.isNotEmpty ? const SizedBox() : builtMostRecentlyWidget(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Sura List',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.whiteColor,
                thickness: 2,
                indent: 30.5,
                endIndent: 30.5,
              );
            },
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // save last sura
                  saveLastSura(
                      suraEnName: filterList[index].suraEnglishName,
                      suraArName: filterList[index].suraArabicName,
                      numOfVerses: filterList[index].numOfVerses);
                  Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                      arguments: filterList[index]);
                },
                child: SuraListWidget(
                  index: index,
                  suraModel: filterList[index],
                ),
              );
            },
            itemCount: filterList.length,
          ))
        ],
      ),
    );
  }

  Widget builtMostRecentlyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently ',
          style: AppStyle.bold16White,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    loadSuraList['suraEnName'] ?? '',
                    style: AppStyle.bold24Black,
                  ),
                  Text(
                    loadSuraList['SuraArName'] ?? '',
                    style: AppStyle.bold24Black,
                  ),
                  Text(
                    '${loadSuraList['numOfVerses']}Verses' ?? '',
                    style: AppStyle.bold18Black,
                  ),
                ],
              ),
              Image.asset('assets/images/most_recently _image.png'),
            ],
          ),
        ),
      ],
    );
  }

  // save last sura
  saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArN ame', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
  }

  getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numOfVerses = prefs.getString('numOfVerses') ?? '';

    /// Map
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': numOfVerses
    };
  }

  // get data from shared preference
  loadLastSura() async {
    loadSuraList = await getLastSura();
    setState(() {});
  }
}
