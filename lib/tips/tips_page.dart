import 'package:flutter/material.dart';

/**
 * @Author: fanyuqing
 * @Description:
 * @date: 2024/6/25
 */
class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    /*
    命名路由传递参数
    Navigator.of(context).pushNamed("new_page", arguments: "hi");

    MaterialApp(
    ... //省略无关代码
    routes: {
     "tip2": (context){
       return TipRoute(text: ModalRoute.of(context)!.settings.arguments);
       },
      },
    );

    同理Get的使用也可以这样*/

    /*
    勾子路由的使用:在多个界面需要判断类似于有没有登录功能时,可以使用onGenerateRoute

    MaterialApp(
      ... //省略无关代码
      onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其他情况则正常打开路由。
        }
        );
      }
    );
    */

    return const Placeholder();
  }
}
