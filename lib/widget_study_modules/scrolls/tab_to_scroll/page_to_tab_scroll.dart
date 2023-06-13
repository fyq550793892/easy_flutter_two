import 'package:easy_flutter/widget_study_modules/scrolls/tab_to_scroll/v_tab.dart';
import 'package:flutter/material.dart';

/**
 * @Author: fanyuqing
 * @Description:
 * @date: 2022/5/20
 */
class PageToTabScroll extends StatefulWidget {
  const PageToTabScroll({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PageToTabScroll> createState() => _PageToTabScrollState();
}

class _PageToTabScrollState extends State<PageToTabScroll> with SingleTickerProviderStateMixin {
  int _counter = 0;

  TabController? _tabController;

  // final GlobalKey _globalKeyOne = GlobalKey();
  // final GlobalKey _globalKeyTwo = GlobalKey();
  // final GlobalKey _globalKeyThree = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  // double _oneYOff = 0.0;
  // double _twoYOff = 0.0;
  // double _threeYOff = 0.0;

  final List<String> _tabNameList = ["蓝色", "绿", "黄"];

  List<GlobalKey> _globalKeyList = [];
  List<double> _yOffList = [];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabNameList.length, vsync: this);

    for (int i = 0; i < _tabNameList.length; i++) {
      _globalKeyList.add(GlobalKey());
      _yOffList.add(0.0);
    }

    _scrollController.addListener(() {
      double of = _scrollController.offset;
      print("of长为 $of  ====${_scrollController.position.maxScrollExtent}");
      for (int i = 0; i < _tabNameList.length; i++) {
        if (of >= _scrollController.position.maxScrollExtent) {
          // 如果滑动距离大于等于最大距离,直接跳转到最后
          _tabController!.animateTo(2);
        } else if (of > _yOffList[i] - _yOffList[0]) {
          _tabController!.animateTo(i);
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          for (int i = 0; i < _tabNameList.length; i++) {
            _yOffList[i] = getY(_globalKeyList[i].currentContext!);
          }
          // _oneYOff = getY(_globalKeyOne.currentContext);
          // _twoYOff = getY(_globalKeyTwo.currentContext);
          // _threeYOff = getY(_globalKeyThree.currentContext);
          // print(
          //     "_oneYOff = $_oneYOff, _twoYOff = $_twoYOff, _threeYOff = $_threeYOff");
        });
      }
    });
  }

  double getY(BuildContext buildContext) {
    print("buildContext = $buildContext");
    final RenderBox box = buildContext.findRenderObject() as RenderBox;
    //final size = box.size;
    final topLeftPosition = box.localToGlobal(Offset.zero);
    return topLeftPosition.dy;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VTabBar(
            onTap: (index) {
              if (index == 0) {
                _scrollController.jumpTo(0);
                _tabController!.animateTo(0);
              } else if (index == 1) {
                _scrollController.jumpTo(_yOffList[1] - _yOffList[0]);
                _tabController!.animateTo(1);
              } else if (index == 2) {
                // 如果是最后Index,直接跳转到最后边
                _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                _tabController!.animateTo(2);
              }
            },
            controller: _tabController,
            labelColor: Colors.blue,
            isScrollable: true,
            tabs: List.generate(
                _tabNameList.length,
                (index) => Tab(
                      text: _tabNameList[index],
                    )),
          ),
          Expanded(
            child: NotificationListener(
              onNotification: (dynamic nofication) {
                if (nofication is ScrollEndNotification) {
                  print("end====");
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      key: _globalKeyList[0],
                      height: 800,
                      color: Colors.blue,
                    ),
                    Container(
                      key: _globalKeyList[1],
                      height: 500,
                      color: Colors.green,
                    ),
                    Container(
                      key: _globalKeyList[2],
                      height: 600,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
