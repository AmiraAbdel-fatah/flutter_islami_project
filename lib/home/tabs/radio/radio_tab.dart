import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_style.dart';

import '../../../utils/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Radio',
                  style: AppStyle.bold16Black,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/radio_image1.png'),
                  Image.asset('assets/images/radio_image2.png'),
                  Image.asset('assets/images/radio_image3.png'),
                  SizedBox(
                      width: width * 1.2,
                      child: Image.asset(
                        'assets/images/radio4_image.png',
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
