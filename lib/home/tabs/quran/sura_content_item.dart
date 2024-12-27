import 'package:flutter/cupertino.dart';
import 'package:islami_app/utils/app_style.dart';

import '../../../utils/app_colors.dart';

class SuraContentItem extends StatelessWidget {
  String content;
  int index;

  SuraContentItem({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryDark, width: 2)),
      child: Text(
        '$content [${index + 1}]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyle.bold20Primary,
      ),
    );
  }
}
