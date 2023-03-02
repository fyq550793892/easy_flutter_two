import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * @Author: fanyuqing
 * @Description: 状态栏使用
 * @date: 2022/7/13
 */
class StateBarUserWidget extends StatelessWidget {
  const StateBarUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle value = SystemUiOverlayStyle.light;
    if (Platform.isAndroid) {
      value = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        /// 安卓系统状态栏存在底色，所以需要加这个
        statusBarIconBrightness: Brightness.dark,

        /// 状态栏字体颜色
      );

      value = SystemUiOverlayStyle(
        // 系统底部导航栏的颜色，不是图标颜色
        systemNavigationBarColor: Colors.white,
        // android系统底部导航栏和应用内容之间分隔线的颜色
        systemNavigationBarDividerColor: null,
        // android顶部状态栏的颜色 android
        statusBarColor: Colors.transparent,
        // android系统导航栏图标的亮度 android
        // systemNavigationBarIconBrightness: Brightness.light,
        // android顶部状态栏图标的亮度
        statusBarIconBrightness: Brightness.dark,
        // ios顶部状态栏图标的亮度
        // statusBarBrightness: Brightness.light,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // 通过套这个来改变单个页面的状态栏
      value: value,
      child: const Scaffold(
        body: Center(
          child: Text("这里是状态栏使用"),
        ),
      ),
    );
  }
}
