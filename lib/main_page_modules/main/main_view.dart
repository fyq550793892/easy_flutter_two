import 'package:easy_flutter/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {
  final logic = Get.put(MainLogic());
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<MainLogic>(
              assignId: true,
              builder: (logic) {
                return Text("我是主页${state.count}");
              },
            ),
            GestureDetector(
              child: Card(child: Text("进入二级页面，需要登录")),
              onTap: () {
                Get.toNamed(RouteConfig.mainSecondPage);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logic.addCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
