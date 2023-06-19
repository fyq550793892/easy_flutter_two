import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

/// @Author: fanyuqing
/// @Description: 瀑布流使用页面
/// @date: 2023/6/19
class WaterFallFlowUsePage extends StatelessWidget {
  const WaterFallFlowUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // height: 200.w,
        // width: 200.w,
        child: WaterfallFlow.builder(
          //cacheExtent: 0.0,
          padding: EdgeInsets.all(5.0),
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            // collectGarbage: ,

            /// follow max child trailing layout offset and layout with full cross axis extend
            /// last child as loadmore item/no more item in [GridView] and [WaterfallFlow]
            /// with full cross axis extend
            //  LastChildLayoutType.fullCrossAxisExtend,

            /// as foot at trailing and layout with full cross axis extend
            /// show no more item at trailing when children are not full of viewport
            /// if children is full of viewport, it's the same as fullCrossAxisExtend
            //  LastChildLayoutType.foot,
            lastChildLayoutTypeBuilder: (index) => index == 20 ? LastChildLayoutType.foot : LastChildLayoutType.none,
          ),
          itemBuilder: (BuildContext context, int index) {
            // 可以根据相关类型显示不同的item
            return Container(
                height: 20.w * index,
                // width: 30.w* index,
                child: Text("这里的值是$index"),
                color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)));
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
