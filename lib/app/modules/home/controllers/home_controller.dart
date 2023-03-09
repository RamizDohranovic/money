import 'package:get/get.dart';
import 'package:money/app/modules/loan/views/loan_view.dart';
import 'package:money/app/modules/pay/controllers/pay_controller.dart';
import 'package:money/app/modules/pay/views/pay_view.dart';

class HomeController extends GetxController {
  PayController payController = Get.put(PayController());
  var countmoney = 0.0.obs;
  var switchvalue = false.obs;
  goToPay() {
    payController.topup.value = false;
    Get.to(() => const PayView(), transition: Transition.cupertino);
  }

  goTopUp() {
    payController.topup.value = true;
    Get.to(() => const PayView());
  }

  goToLoan() {
    Get.to(() => const LoanView());
  }

  void increment() => countmoney.value++;
}
