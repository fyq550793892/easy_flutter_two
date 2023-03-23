import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// @Author: fanyuqing
/// @Description: 动画相关
/// @date: 2023/3/23
class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

/// 普通动画的实现
class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
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
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          // 执行动画
          _animationController.forward();
        },
      ),
      body: Container(
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
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

/// hero动画的实现 第一页
class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_a_photo,
        ),
        onPressed: () {
          Get.to(HeroPageOther());
        },
      ),
      // appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: "imageHero",
          child: Image.network("https://picsum.photos/250?image=9"),
        ),
      ),
    );
  }
}

class HeroPageOther extends StatefulWidget {
  const HeroPageOther({Key? key}) : super(key: key);

  @override
  State<HeroPageOther> createState() => _HeroPageOtherState();
}

class _HeroPageOtherState extends State<HeroPageOther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.outbond,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      body: Center(
        child: Hero(
          tag: "imageHero",
          child: Image.network(
            "https://picsum.photos/250?image=9",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
