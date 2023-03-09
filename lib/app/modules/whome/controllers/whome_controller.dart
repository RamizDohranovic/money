import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WhomeController extends GetxController {
  final count = 0.obs;
  final id = 0.obs;
  final textEditingController = TextEditingController();
  final paymentList = <Payment>[].obs;
  final DateFormat formatter = DateFormat('dd. MMMM yyyy. HH:mm:ss');

  Random random = Random();
}

class Payment {
  final String name;
  final double amount;
  final bool pay;
  final DateTime dateTime;
  final int idtransaction;
  final int idmerchant;

  Payment(
      {required this.name,
      required this.amount,
      required this.pay,
      required this.dateTime,
      required this.idtransaction,
      required this.idmerchant});
}
