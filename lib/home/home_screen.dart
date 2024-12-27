import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/hadith/hadith_tab.dart';
import 'package:islami_app/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/home/tabs/time/time_tab.dart';

import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 3;
  List<String> backgroundImage = [
    'assets/images/quran_bg.png',
    'assets/images/hadith_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Image.asset(backgroundImage[selectedIndex]),
        Image.asset(
          'assets/images/${getBackgroundImage()}.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                        index: 0, imageName: 'quran_icon'),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                        index: 0, imageName: 'hadith_icon'),
                    label: 'Hadith'),
                BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                        index: 0, imageName: 'sebha_icon'),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                        index: 0, imageName: 'radio_icon'),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                        index: 0, imageName: 'time_icon'),
                    label: 'Time'),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  Widget builtItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ),
          )
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }

  String getBackgroundImage() {
    switch (selectedIndex) {
      case 0:
        return 'quran_bg';
      case 1:
        return 'hadith_bg';
      case 2:
        return 'sebha_bg';
      case 3:
        return 'radio_bg';
      case 4:
        return 'time_bg';
      default:
        return 'quran_bg';
    }
  }
}
