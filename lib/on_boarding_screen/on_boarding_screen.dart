import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../app_colors.dart';
import '../home/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = 'on boarding screen';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: SizedBox(
              height: 170,
              width: 290,
              child: Image.asset('assets/images/Logo.png'),
            ),
          ),
          //   flexibleSpace: Container(height: 150,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('assets/images/Logo.png'),
          //           fit: BoxFit.fill
          //     ),
          //   ),
          //   // backgroundColor: AppColors.blackColor,
          //   // title: Image.asset('assets/images/Logo.png',height: 170,),
          //   // centerTitle: true,
          // ),
        ),
      ),
      body: OnBoardingSlider(
        headerBackgroundColor: AppColors.blackColor,
        finishButtonText: 'Home',
        pageBackgroundColor: AppColors.blackColor,
        onFinish: () {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        },
        // middle: Image.asset(
        //   'assets/images/most_recently _image.png',
        //   color: AppColors.primaryDark,
        // ),
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: AppColors.blackBgColor,
        ),
        // skipTextButton: Text('skip'),
        //trailing: Text('Login'),
        background: [
          Image.asset('assets/images/welcome_image.png'),
          Image.asset('assets/images/quran_book.png'),
          Image.asset('assets/images/kabba_image.png'),
          Image.asset('assets/images/sebha_image.png'),
          Image.asset('assets/images/radio_image.png'),
        ],
        totalPage: 5,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 420,
                ),
                Text(
                  'Welcome To Islmi App',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 420,
                ),
                Text(
                  'Islami Welcome To Islami',
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'We Are Very Excited To Have You In Our Community Back Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 420,
                ),
                Text(
                  'Reading the Quran',
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Read, and your Lord is the Most Generous',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 420,
                ),
                Text(
                  'Bearish',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Praise the name of your Lord, the Most High',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 420,
                ),
                Text(
                  'Holy Quran Radio',
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'You can listen to the Holy Quran Radio through the application for free and easily',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
