import 'package:flutter/material.dart';

/// @Author: fanyuqing
/// @Description: 自动滑动页
/// @date: 2022/10/13
class AutoScrollPages extends StatefulWidget {
  /// 1-这里的key保证是PageStorageKey
  const AutoScrollPages({Key? key}) : super(key: key);

  @override
  State<AutoScrollPages> createState() => _AutoScrollPagesState();
}

class _AutoScrollPagesState extends State<AutoScrollPages> {
  GlobalKey globalKey = GlobalKey();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // // 4-在需要的地方进行滚动调用
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   Future.delayed(Duration(milliseconds: 300), () {
    //     if (globalKey.currentContext != null && mounted) {
    //       Scrollable.ensureVisible(
    //         globalKey.currentContext,
    //         duration: Duration(milliseconds: 500),
    //         curve: Curves.linear,
    //       );
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 2-这里保证是SingleChildScrollView,不能用listViewbuilder
      body: SingleChildScrollView(
        child: Column(
          children: listWid(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 4-在需要的地方进行滚动调用
          Scrollable.ensureVisible(
            globalKey.currentContext!,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        },
        child: Icon(Icons.done),
      ),
    );
  }

  List<Widget> listWid() {
    List<Widget> list = [];
    for (int i = 0; i < 30; i++) {
      list.add(ListTile(
        title: Text(
          "我的值是$i",
          key: i == 20 ? globalKey : null,

          /// 3-在需要滚到的位置设置globalKey
        ),
      ));
    }
    return list;
  }
}
