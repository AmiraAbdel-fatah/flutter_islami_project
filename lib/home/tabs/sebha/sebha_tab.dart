import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_style.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  String displayText = 'سبحان الله';
  List<String> azkar = ["الله أكبر", "الحمد لله", "محمد رسول الله"];
  late AnimationController controller;
  late Animation<double> animation;

  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
  }

  void dipose() {
    controller.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter % 33 == 0) {
        displayText = azkar[(counter ~/ 33) % azkar.length];
      }
      controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/Logo.png'),
          SizedBox(
            height: 20,
          ),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: AppStyle.bold36Primary,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          // AnimatedBuilder(
          //   animation: animation,
          //   builder: (context,child){
          //     return Transform.scale(
          //     scale: animation.value,
          // child: child,
          //     );
          // },
          //   child:
          GestureDetector(
            onTap: incrementCounter,
            child: Stack(
              children: [
                Container(
                  height: height * .53,
                  width: width * .88,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/sbha_image_rotation.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: height * .25,
                      ),
                      Text(
                        displayText,
                        style: AppStyle.bold36Primary,
                        textAlign: TextAlign.center,
                      ),
                      Positioned(
                          bottom: 16,
                          child: Text(
                            '${counter % 33}',
                            style: AppStyle.bold36Primary,
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          // )
        ],
      ),
    );
  }
}
