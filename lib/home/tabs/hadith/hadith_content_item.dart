import 'package:flutter/cupertino.dart';

import '../../../app_colors.dart';

class HadithContentItem extends StatelessWidget {
  String content;

  HadithContentItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.primaryDark, fontSize: 20),
      ),
    );
  }
}
