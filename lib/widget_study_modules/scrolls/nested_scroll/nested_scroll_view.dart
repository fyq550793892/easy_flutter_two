import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'nested_scroll_logic.dart';

/// @Author: fanyuqing
/// @Description:  滑动到一个地方并停住
/// @date: 2023/6/13
class NestedScrollPage extends StatefulWidget {
  @override
  State<NestedScrollPage> createState() => _NestedScrollPageState();
}

class _NestedScrollPageState extends State<NestedScrollPage> with SingleTickerProviderStateMixin {
  final logic = Get.put(NestedScrollLogic());

  final state = Get.find<NestedScrollLogic>().state;

  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              // snap: true,
              pinned: true,
              expandedHeight: 200,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/star_calendar_share_no_content.webp",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300.w,
                width: double.infinity,
                color: Colors.yellow,
              ),
            ),
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TabBar(
                    tabs: [
                      Text(
                        "red",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "white",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "blue",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                    controller: tabController,
                  ),
                ),
                SliverFillViewport(
                  delegate: SliverChildListDelegate(
                    [
                      TabBarView(
                        controller: tabController,
                        children: [
                          Container(
                            height: 100.w,
                            width: 200.w,
                            color: Colors.red,
                          ),
                          Container(
                            height: 100.w,
                            width: 200.w,
                            color: Colors.white,
                          ),
                          Container(
                            height: 100.w,
                            width: 200.w,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
