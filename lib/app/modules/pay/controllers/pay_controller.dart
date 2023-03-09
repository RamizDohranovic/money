import 'package:get/get.dart';

class PayController extends GetxController {
  final typnumber = ''.obs;
  final topup = false.obs;
  void onKeyPressed(String keyValue) {
    typnumber.value += keyValue;
  }

  void onDeleteKeyPressed() {
    if (typnumber.value.isNotEmpty) {
      typnumber.value =
          typnumber.value.substring(0, typnumber.value.length - 1);
    }
  }

  void gg() {}
}
