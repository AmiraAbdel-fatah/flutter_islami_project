import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/Logo.png'),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: incrementCounter,
            child: Stack(
              children: [
                Container(
                  height: 460,
                  width: 379,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/sbha_image_rotation.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Center(
                    child: Text(
                      'سبحان الله\n$counter',
                      style: TextStyle(
                        fontSize: 36,
                        color: AppColors.primaryDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                //Image.asset('assets/images/sbha_image_rotation.png'),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
