import 'package:easy_flutter/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_second_logic.dart';

class MainSecondPage extends StatelessWidget {
  final logic = Get.put(MainSecondLogic());
  final state = Get.find<MainSecondLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: GestureDetector(
          child: Card(child: Text("登录成功，返回1")),
          onTap: () {
            Get.offNamedUntil(RouteConfig.mainPage, ModalRoute.withName(RouteConfig.mainPage));
          },
        ),
      ),
    );
  }
}
