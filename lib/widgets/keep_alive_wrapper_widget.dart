import 'package:flutter/material.dart';

/**
 * @Author: fanyuqing
 * @Description: 保证缓存 可参考
 * https://book.flutterchina.club/chapter6/keepalive.html#_6-8-1-automatickeepalive
 * @date: 2022/5/20
 */
class KeepAliveWrapperWidget extends StatefulWidget {
  KeepAliveWrapperWidget({
    Key? key,
    required this.child,
    this.keepAlive = true,
  }) : super(key: key);

  final Widget child;

  final bool keepAlive;

  @override
  State<KeepAliveWrapperWidget> createState() => _KeepAliveWrapperWidgetState();
}

class _KeepAliveWrapperWidgetState extends State<KeepAliveWrapperWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(KeepAliveWrapperWidget oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
