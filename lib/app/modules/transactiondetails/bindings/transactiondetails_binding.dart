import 'package:get/get.dart';

import '../controllers/transactiondetails_controller.dart';

class TransactiondetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactiondetailsController>(
      () => TransactiondetailsController(),
    );
  }
}
