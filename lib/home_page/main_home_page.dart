import 'package:easy_flutter/routes/route_config.dart';
import 'package:easy_flutter/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

/**
 * @Author: fanyuqing
 * @Description:
 * @date: 2022/5/6
 */
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();

  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initNet();
  }

  void initNet() async {
    // 这里设备tts播报语音
    await flutterTts.getLanguages;
    await flutterTts.getEngines;
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("zh-CN");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () async {
              var result = await flutterTts.speak("你好");
              // Get.toNamed(RouteConfig.jverifyPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入极光"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.mainPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入mainPage"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.permissionPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入权限页"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.locationPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入高德定位页"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.customViewPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入自定义图形页"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.customWidgetPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入自定义FitBox_widgets"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              String title = "123";
              showDialog(
                context: context,
                builder: (context) {
                  /*
                  1/ dialog写法,先套center,再设Column中的mainAxisSize: MainAxisSize.min属性
                  2--- 更新dialog状态的几种方法 2.1: 直接抽取StatefulWidget 2.2: 套StatefulBuilder 2.3: 直接调用源码 markNeedsBuild
                   */
                  return DialogWidget();
                },
              );
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("显示dialog"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.pageViewPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("滚动PageView练习widgets"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.localLanguagePage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入语言练习页"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.globalBarPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入状态栏练习页"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.dialogShowPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入自定义dialog页面"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.infoPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入手机信息页面"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.autoScrollPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入自动滚动到某一个item页面"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.longPicSavePage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("进入保存长图页"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.animationPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("动画学习相关"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.demoTestPage);
            },
            child: ListTile(
              title: Card(
                child: Container(
                  child: Text("日常练习页,功能成熟后移植出来"),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
