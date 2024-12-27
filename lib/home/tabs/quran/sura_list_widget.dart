import 'package:flutter/cupertino.dart';
import 'package:islami_app/utils/app_style.dart';

import '../../../model/sura_model.dart';
import '../../../utils/app_colors.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;
  int index;

  SuraListWidget({super.key, required this.suraModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_image.png'),
            Text('${index + 1}', style: TextStyle(color: AppColors.whiteColor)),
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraModel.suraEnglishName, style: AppStyle.bold20White),
                  Text('${suraModel.numOfVerses} Verses',
                      style: AppStyle.bold20White),
                ],
              ),
              Text(suraModel.suraArabicName, style: AppStyle.bold20White),
            ],
          ),
        ),
      ],
    );
  }
}
