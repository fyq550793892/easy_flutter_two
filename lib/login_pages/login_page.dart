import 'package:easy_flutter/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("我是登录页"),
              GestureDetector(
                child: Container(
                  child: Text("去登录"),
                  height: 100,
                  width: 200,
                  color: Colors.blue,
                ),
                onTap: () {
                  SpUtil.putBool("login", true);
                  Get.toNamed(RouteConfig.inputCodePage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
