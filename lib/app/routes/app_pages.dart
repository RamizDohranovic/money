// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loan/bindings/loan_binding.dart';
import '../modules/loan/views/loan_view.dart';
import '../modules/pay/bindings/pay_binding.dart';
import '../modules/pay/views/pay_view.dart';
import '../modules/topup/bindings/topup_binding.dart';
import '../modules/topup/views/topup_view.dart';
import '../modules/transactiondetails/bindings/transactiondetails_binding.dart';
import '../modules/transactiondetails/views/transactiondetails_view.dart';
import '../modules/whome/bindings/whome_binding.dart';
import '../modules/whome/views/whome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PAY,
      page: () => const PayView(),
      binding: PayBinding(),
    ),
    GetPage(
      name: _Paths.TOPUP,
      page: () => const TopupView(),
      binding: TopupBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONDETAILS,
      page: () => const TransactiondetailsView(),
      binding: TransactiondetailsBinding(),
    ),
    GetPage(
      name: _Paths.WHOME,
      page: () => const WhomeView(),
      binding: WhomeBinding(),
    ),
    GetPage(
      name: _Paths.LOAN,
      page: () => const LoanView(),
      binding: LoanBinding(),
    ),
  ];
}
