import 'package:easy_flutter/utils/sq_toast.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/**
 * @Author: fanyuqing
 * @Description: 权限页
 * @date: 2022/5/6
 */
class PermissionPage extends StatelessWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GestureDetector(
            child: Card(
              child: Container(
                alignment: Alignment.center,
                height: 80,
                child: Text("请求存储权限"),
              ),
            ),
            onTap: () {
              requestLocationPermission().then((value) {
                if (value) {
                  SQToast.show("已经授权");
                } else {
                  SQToast.show("未授权");
                }
              });
            },
          )
        ],
      ),
    );
  }

  /// 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
