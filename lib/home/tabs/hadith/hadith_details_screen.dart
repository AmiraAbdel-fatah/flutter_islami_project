import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../../model/hadith_model.dart';
import 'hadith_content_item.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadith_details';

  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
        centerTitle: true,
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
              SizedBox(
                height: 20,
              ),
              Text(
                args.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return HadithContentItem(content: args.content[index]);
                  },
                  itemCount: args.content.length,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
