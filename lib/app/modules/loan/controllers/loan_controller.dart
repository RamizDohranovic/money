import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:money/app/modules/home/controllers/home_controller.dart';

HomeController homeController = Get.put(HomeController());
final LoanDecisionService loanDecisionService = LoanDecisionService();

class LoanController extends GetxController {
  final count = 0.obs;
  final TextEditingController textcontrollers = TextEditingController();
  var monthly = 0.obs;
  var firstApply = false.obs;
  var mexpenses = 0.obs;
  var amount = 0.obs;
  var term = 0.obs;
  var randNum = 0.obs;
  var switchvalue = false.obs;
  var waitapproved = false.obs;
  var hasApplied = false;
  var newdecision = false;
}

class LoanDecisionService {
  Future<String> generateLoanDecision(
      int monthlySalary,
      int estimatedMonthlyExpenses,
      int loanAmount,
      int loanTerm,
      double moneyInAccount) async {
    final response = await http.get(Uri.parse(
        'https://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1'));
    final json = jsonDecode(response.body);
    final randomNumber = json[0];

    if (randomNumber > 50 &&
        moneyInAccount > 1000 &&
        monthlySalary > 1000 &&
        estimatedMonthlyExpenses < (monthlySalary / 3) &&
        (loanAmount / loanTerm) < (monthlySalary / 3)) {
      Rx<double> loanamount = Rx<double>(loanAmount.toDouble());
      homeController.countmoney.value =
          homeController.countmoney.value + loanamount.value;
      return 'APPROVED';
    } else if (randomNumber < 50 && moneyInAccount < 1000) {
      return 'DECLINEDTOAPPROVED';
    } else {
      return 'DECLINED';
    }
  }
}
