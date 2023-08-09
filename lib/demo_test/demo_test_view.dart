import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/jump_dis_widget.dart';
import 'demo_test_logic.dart';

class DemoTestPage extends StatefulWidget {
  @override
  State<DemoTestPage> createState() => _DemoTestPageState();
}

class _DemoTestPageState extends State<DemoTestPage> with SingleTickerProviderStateMixin {
  final logic = Get.put(DemoTestLogic());

  final state = Get.find<DemoTestLogic>().state;
  var fileName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () async {},
      ),
      body: Container(
        height: 300.w,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 100.w),
        color: Colors.black,
        child: JumpDisWidget(
          position: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
