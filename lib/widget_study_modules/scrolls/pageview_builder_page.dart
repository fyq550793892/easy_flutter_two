import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @Author: fanyuqing
/// @Description:  实现pageView循环  https://blog.csdn.net/sxt_zls/article/details/110490174
/// @date: 2023/6/14
class PageViewBuilderPage extends StatefulWidget {
  const PageViewBuilderPage({Key? key}) : super(key: key);

  @override
  State<PageViewBuilderPage> createState() => _PageViewBuilderPageState();
}

class _PageViewBuilderPageState extends State<PageViewBuilderPage> {
  List<String> _pageViewUserValue = ["第一个", "第二个", "第三个", "第四个"];
  List<String> _pageViewValue = [];
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = _pageController.initialPage;

    _pageViewValue.add(_pageViewUserValue[_pageViewUserValue.length - 1]);
    _pageViewValue.addAll(_pageViewUserValue);
    _pageViewValue.add(_pageViewUserValue[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          return Container(
            width: 100.w,
            height: 100.w,
            child: Text("这里的值是 ${_pageViewValue[index]}"),
          );
        },
        itemCount: _pageViewValue.length,
        onPageChanged: (index) {
          if (index == 0) {
            // 选中了第一个,那么再滑动则到
            _currentPage = _pageViewValue.length - 2;
            _pageController.jumpToPage(_currentPage);
          } else if (index == _pageViewValue.length - 1) {
            _currentPage = 1;
            _pageController.jumpToPage(_currentPage);
          } else {
            _currentPage = index;
            _pageController.jumpToPage(_currentPage);
          }
          setState(() {});
        },
      ),
    );
  }
}
