import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SQToast {
  static show(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER
    );
  }

  static showLoading({String msg = ""}) {
    EasyLoading.show(status: msg);
  }

  static disMissLoading() {
    if(EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}