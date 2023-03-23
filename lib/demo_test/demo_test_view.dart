import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'demo_test_logic.dart';

class DemoTestPage extends StatefulWidget {
  @override
  State<DemoTestPage> createState() => _DemoTestPageState();
}

class _DemoTestPageState extends State<DemoTestPage>
    with SingleTickerProviderStateMixin {
  final logic = Get.put(DemoTestLogic());

  final state = Get.find<DemoTestLogic>().state;

  late AnimationController _animationController;
  late Animation<double> _curAnimation; // 图形变化
  late Animation<double> _tweenAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _curAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    );
    _tweenAnimation = Tween(begin: 50.w, end: 100.w).animate(_curAnimation);

    _tweenAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          // 执行动画
          _animationController.forward();
        },
      ),
      body: VisibilityDetector(
        key: ValueKey("demo_test"),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction == 0.0) {}
        },
        child: Container(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Icon(
                Icons.health_and_safety_rounded,
                color: Colors.red,
                size: _tweenAnimation.value,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
