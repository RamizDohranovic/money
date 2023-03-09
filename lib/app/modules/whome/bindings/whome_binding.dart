import 'package:get/get.dart';

import '../controllers/whome_controller.dart';

class WhomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhomeController>(
      () => WhomeController(),
    );
  }
}
