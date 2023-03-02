import 'package:flutter/material.dart';

/**
 * @Author: fanyuqing
 * @Description:
 * @date: 2022/5/17
 */
class MFitBoxWidget extends StatelessWidget {
  final Widget child;
  const MFitBoxWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder用于 拿到父组件约束
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大
        print("constraints = ${constraints}");
        return FittedBox(
          // child: child,
          // ConstrainedBox用于对子组件添加额外的约束
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              maxWidth: double.infinity,
              minWidth: constraints.maxWidth,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
