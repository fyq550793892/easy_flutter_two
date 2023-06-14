import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @Author: fanyuqing
/// @Description: 多语言的使用页面
/// @date: 2023/6/14
/// 一/切换语言
//  (1)  数据类继承自Translations,并重写keys
// class Messages extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
//         'zh_CN': {
//           'hello': '你好 世界',
//         },
//         'de_DE': {
//           'hello': 'Hallo Welt',
//         }
//       };
// }
// (2) GetMaterialApp中加入属性
//   translations: LocalMessage(),
//   locale: Locale('zh', 'CN'),
//  fallbackLocale: Locale('en', 'US'),
// (3) 使用时使用 key值 并加入.tr    比如 Text('hello'.tr);
// (4) 更改语言, updateLocale
//  var locale = Locale('en', 'US');
//  Get.updateLocale(locale);

/// 二/切换主题
/// Get.changeTheme(ThemeData.dark());

class LocalLanguagePage extends StatelessWidget {
  const LocalLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("语言相关"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              var locale = Locale('en', 'US');
              Get.updateLocale(locale);
              // Get.changeTheme(ThemeData.dark());
            },
            child: Text("切换语言"),
          ),
          Text("我是用于演示的,我当前语言是 ${"hello".tr}"),
        ],
      ),
    );
  }
}
