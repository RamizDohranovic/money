import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money/app/modules/home/controllers/home_controller.dart';
import 'package:money/app/modules/home/views/home_view.dart';
import 'package:money/app/modules/whome/controllers/whome_controller.dart';
import 'package:money/app/modules/whome/views/whome_view.dart';
import 'package:money/const.dart';

import '../controllers/pay_controller.dart';

List<dynamic> typinfo = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  ".",
  "0",
  "<",
];

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PayController payController = Get.put(PayController());
    WhomeController whomeController = Get.put(WhomeController());
    HomeController homeController = Get.put(HomeController());
    Widget buildButton(String keyValue) {
      return TextButton(
        onPressed: () {
          if (keyValue == '<') {
            payController.onDeleteKeyPressed();
          } else {
            payController.onKeyPressed(keyValue);
          }
        },
        child: Text(
          keyValue,
          style: const TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Positioned(
              top: 5,
              child: Text(
                'MoneyApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            Positioned(
              top: 1,
              right: 10,
              child: GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(top: 5, right: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('image/close.png'))),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            Column(
              children: [
                const SizedBox(),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'How much?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Obx(() => RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: '£',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: payController.typnumber.contains('.')
                                      ? payController.typnumber.substring(0,
                                          payController.typnumber.indexOf('.'))
                                      : payController.typnumber.isEmpty
                                          ? '0'
                                          : payController.typnumber.value,
                                  style: const TextStyle(fontSize: 50.0),
                                ),
                                TextSpan(
                                  text: payController.typnumber.contains('.')
                                      ? '.${payController.typnumber.substring(payController.typnumber.indexOf('.') + 1)}'
                                      : '.00',
                                  style: const TextStyle(fontSize: 32.0),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildButton('1'),
                            buildButton('2'),
                            buildButton('3'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildButton('4'),
                            buildButton('5'),
                            buildButton('6'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildButton('7'),
                            buildButton('8'),
                            buildButton('9'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildButton('.'),
                            buildButton('0'),
                            buildButton('<'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    child: Container(
                        margin: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 20, bottom: 20),
                          child: Text(
                            payController.topup.value == false
                                ? 'Next'
                                : 'Top Up',
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.white),
                          ),
                        )),
                    onTap: () {
                      if (payController.topup.value == false) {
                        if (payController.typnumber.value.isNotEmpty) {
                          Get.to(() => const WhomeView());
                        }
                      } else {
                        if (payController.typnumber.value.isNotEmpty) {
                          var payment = Payment(
                              name: 'Top Up',
                              amount:
                                  double.parse(payController.typnumber.value),
                              dateTime: DateTime.now(),
                              idtransaction:
                                  whomeController.random.nextInt(90000000),
                              idmerchant: whomeController.random.nextInt(9999),
                              pay: false);
                          whomeController.paymentList.add(payment);
                          double value =
                              double.parse(payController.typnumber.value);
                          homeController.countmoney.value =
                              homeController.countmoney.value + value;

                          whomeController.textEditingController.clear();
                          payController.typnumber.value = '';
                          Get.off(() => const HomeView());
                        }
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
