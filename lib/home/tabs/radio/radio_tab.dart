import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  style: TextStyle(color: AppColors.blackColor, fontSize: 24),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/radio_image1.png'),
          Image.asset('assets/images/radio_image2.png'),
          Image.asset('assets/images/radio_image3.png'),
        ],
      ),
    );
  }
}
