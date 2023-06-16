import 'package:get/get.dart';

import 'demo_test_state.dart';

class DemoTestLogic extends GetxController {
  final DemoTestState state = DemoTestState();

  @override
  void onInit() {
    super.onInit();
    interval(state.content, (callback) {
      // state.content.value++;
      print("这里的值是 interval = $callback");
    });
    debounce(state.content, (callback) {
      // state.content.value++;
      print("这里的值是 debounce = $callback");
    });
  }

  void mUpdate() {
    update();
  }
}
