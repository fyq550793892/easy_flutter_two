import 'dart:math';

import 'package:flutter/material.dart';

/**
 * @Author: fanyuqing
 * @Description: 自定义图形页
 * @date: 2022/5/9
 */

class CustomViewPage extends StatefulWidget {
  const CustomViewPage({Key? key}) : super(key: key);

  @override
  State<CustomViewPage> createState() => _CustomViewPageState();
}

class _AnimationDemo01State extends State<CustomViewPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    // 2.动画添加Curve效果
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut, reverseCurve: Curves.easeOut);
    // 3.监听动画
    // 4.控制动画的翻转
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    // 5.设置值的范围
    animation = Tween(begin: 50.0, end: 120.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (ctx, child) {
            return Icon(
              Icons.favorite,
              color: Colors.red,
              size: animation.value,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _CustomViewPageState extends State<CustomViewPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));

    // 2.动画添加Curve效果
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.elasticInOut, reverseCurve: Curves.easeOut);

    _animation = Tween(begin: 0.0, end: pi).animate(_animationController);

    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController.forward();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("自定义图形页"),
      ),
      body: Column(
        children: [
          AnimatedBuilder(
            builder: (BuildContext context, Widget? child) {
              return CustomPaint(
                size: Size(300, 300),
                painter: MCirclePainter(_animation.value),
              );
            },
            animation: _animation,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _animationController.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class MCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint()
      ..color = Colors.blue
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(30, 30) & size, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 10;
    canvas.drawLine(Offset(10, 50), Offset(100, 50), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// 圆形
class MCirclePainter extends CustomPainter {
  final double value;
  MCirclePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    print('value = $value');
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(Offset(30, 30) & Size(100, 100), 0, 2 * pi, false, paint);
    paint
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    // canvas.drawCircle(Offset(100, 100), 50, paint);
    canvas.drawArc(Offset(30, 30) & Size(100, 100), 0, value, false, paint);
  }

  @override
  bool shouldRepaint(covariant MCirclePainter oldDelegate) {
    return true;
  }
}
