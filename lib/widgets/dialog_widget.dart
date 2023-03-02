import 'package:flutter/material.dart';

/**
 * @Author: fanyuqing
 * @Description:
 * @date: 2022/5/17
 */
class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  String title = "123";
  @override
  Widget build(BuildContext context) {
    return
      Center(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text("确定"),
                  onTap: () {
                    setState(() {
                      title = "456";
                    });
                  },
                ),
                GestureDetector(
                  child: Text("退出"),
                  onTap: () {
                    // Get.back();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
