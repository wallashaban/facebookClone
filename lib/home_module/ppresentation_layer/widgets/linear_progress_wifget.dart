import 'package:flutter/material.dart';

import '../../../core/utils/exports.dart';

class LinearProgressWidget extends StatefulWidget {
  const LinearProgressWidget({super.key});

  @override
  State<LinearProgressWidget> createState() => _LinearProgressWidgetState();
}

class _LinearProgressWidgetState extends State<LinearProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 5))
      ..addListener(() {
        setState(() {});
      });

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: <Widget>[
            LinearProgressIndicator(
              value: animation.value,
              color: AppColors.black,
              backgroundColor: AppColors.lightGray,
            ),
            /*  const LinearProgressIndicator(
              color: AppColors.black,
            ) */
          ]),
        ),
      ),
    );
  }
}
