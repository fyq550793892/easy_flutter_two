import 'package:get/get.dart';

class JverifyLogic extends GetxController {
  // final JverifyState state = JverifyState();
  // final Jverify jverify = new Jverify();
  //
  // /// 统一 key
  // final String f_result_key = "result";
  //
  // /// 错误码
  // final String f_code_key = "code";
  //
  // /// 回调的提示信息，统一返回 flutter 为 message
  // final String f_msg_key = "message";
  //
  // /// 运营商信息
  // final String f_opr_key = "operator";
  //
  // String _result = "token=";
  // var controllerPHone = new TextEditingController();
  // String? _token;
  // @override
  // void onInit() {
  //   super.onInit();
  //
  //   jverify.setup(
  //     appKey: "3fb68634efde99f90d71bdde",
  //     channel: "devloper-default",
  //   ); // 初始化sdk,  appKey 和 channel 只对ios设置有效
  //   jverify.setDebugMode(true);
  //
  //   jverify.checkVerifyEnable().then((map) {
  //     bool result = map["result"];
  //     if (result) {
  //       // 当前网络环境支持认证
  //       Get.snackbar("123", "可以谁");
  //     } else {
  //       // 当前网络环境不支持认证
  //       Get.snackbar("123", "不可以谁");
  //     }
  //   });
  // }
  //
  // /// sdk 初始化是否完成
  // void isInitSuccess() {
  //   jverify.isInitSuccess().then((map) {
  //     bool result = map[f_result_key];
  //     print("result = $result");
  //   });
  // }
  //
  // void getToken() {
  //   jverify.getToken().then((map) {
  //     int _code = map["code"]; // 返回码，2000代表获取成功，其他为失败，详见错误码描述
  //     String _token = map["content"]; // 成功时为token，可用于调用验证手机号接口。token有效期为1分钟，超过时效需要重新获取才能使用。失败时为失败信息
  //     String _operator = map["operator"]; // 成功时为对应运营商，CM代表中国移动，CU代表中国联通，CT代表中国电信。失败时可能为null
  //     print("_code === $_code");
  //   });
  // }
}
