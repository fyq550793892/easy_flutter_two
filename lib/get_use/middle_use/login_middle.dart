import 'package:easy_flutter/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

// 这个是用于token超时后,会弹出登录或者有其他错误时弹出登录,可以进行统一的处理
class LoginMiddle extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool login = SpUtil.getBool("login") ?? false;
    if (login) {
      return null;
    } else {
      // 加入 AuthService
      Future.delayed(Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));
      return const RouteSettings(
        name: RouteConfig.loginPage,
      );
    }
  }
}
