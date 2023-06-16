import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'demo_test_logic.dart';

class DemoTestPage extends StatefulWidget {
  @override
  State<DemoTestPage> createState() => _DemoTestPageState();
}

class _DemoTestPageState extends State<DemoTestPage> with SingleTickerProviderStateMixin {
  final logic = Get.put(DemoTestLogic());

  final state = Get.find<DemoTestLogic>().state;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          state.content.value++;
        },
      ),
      body: Center(
        child: Obx(() {
          return Text("我点了多次后的值是 ${state.content.value}");
        }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
