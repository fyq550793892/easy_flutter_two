import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @Author: fanyuqing
 * @Description: 跳远距离
 * @date: 2023/8/1
 */
class JumpDisWidget extends StatelessWidget {
  final double position; // 跳到的位置
  final double identifyingWidget; // 标识宽度
  final double needTextSize; // 需要用到的文字占用高度

  final Color startColor;
  final Color endColor;
  final Color jumpColor;
  final int startCode;
  final int endCode; // 结束的数值 300厘米
  final int jumpCode;

  JumpDisWidget({
    Key? key,
    this.position = 0,
    this.endCode = 300,
    this.startCode = 0,
    this.jumpCode = 0,
    double? identifyingWidget,
    double? needTextSize,
    this.startColor = Colors.yellow,
    this.endColor = Colors.white,
    this.jumpColor = Colors.green,
  })  : this.identifyingWidget = identifyingWidget ?? 20.w,
        this.needTextSize = needTextSize ?? 30.w,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 起跳位置
        Positioned(
          child: Text(
            "$startCode",
            style: TextStyle(fontSize: 24.w, color: startColor),
          ),
          top: 0,
          right: 0,
          left: 0,
          // bottom: 0,
        ),
        Positioned(
          left: 0.w,
          bottom: needTextSize,
          top: needTextSize,
          // right: 0,
          child: VerticalDivider(
            width: identifyingWidget,
            thickness: identifyingWidget,
            color: startColor,
          ),
        ),
        Positioned(
          child: Text(
            "$startCode",
            style: TextStyle(fontSize: 24.w, color: startColor),
          ),
          // top: 0,
          right: 0,
          left: 0,
          bottom: 0,
        ),

        // 跳到的位置
        Positioned(
          child: Text(
            "$startCode",
            style: TextStyle(fontSize: 24.w, color: jumpColor),
          ),
          top: 0,
          left: position,
        ),
        Positioned(
          left: position,
          bottom: needTextSize,
          top: needTextSize,
          child: VerticalDivider(
            width: identifyingWidget,
            thickness: identifyingWidget,
            color: jumpColor,
          ),
        ),
        Positioned(
          child: Text(
            "$startCode",
            style: TextStyle(fontSize: 24.w, color: jumpColor),
          ),
          bottom: 0,
          left: position,
        ),

        // 结束位置
        Positioned(
          child: Text(
            "$endCode",
            style: TextStyle(fontSize: 24.w, color: endColor),
          ),
          top: 0,
          right: 0,
        ),
        Positioned(
          bottom: needTextSize,
          top: needTextSize,
          right: 0,
          child: VerticalDivider(
            width: identifyingWidget,
            thickness: identifyingWidget,
            color: endColor,
          ),
        ),
        Positioned(
          child: Text(
            "$endCode",
            style: TextStyle(fontSize: 24.w, color: endColor),
          ),
          right: 0,
          bottom: 0,
        ),
      ],
    );
  }
}
