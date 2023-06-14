import 'package:get/get.dart';

/// @Author: fanyuqing
/// @Description: 语言基础类
/// @date: 2023/6/14
class LocalMessage extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'hello': '你好 世界',
        },
        'en_US': {
          'hello': 'hi world',
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };
}
