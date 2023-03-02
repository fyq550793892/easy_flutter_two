import 'package:easy_flutter/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 验证码
class NumCodePage extends StatelessWidget {
  const NumCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text("登录成功，返回"),
          onTap: () {
            // Get.offNamedUntil(RouteConfig.mainPage, ModalRoute.withName(RouteConfig.mainPage));
            Get.until(ModalRoute.withName(RouteConfig.mainPage));
            // Get.offAndToNamed(RouteConfig.mainPage);
          },
        ),
      ),
    );
  }
}
