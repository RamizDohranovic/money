import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money/app/modules/home/controllers/home_controller.dart';
import 'package:money/app/modules/home/views/home_view.dart';
import 'package:money/app/modules/pay/controllers/pay_controller.dart';
import 'package:money/const.dart';

import '../controllers/whome_controller.dart';

class WhomeView extends GetView<WhomeController> {
  const WhomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WhomeController whomeController = Get.put(WhomeController());
    PayController payController = Get.put(PayController());
    HomeController homeController = Get.put(HomeController());
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
              top: 5,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 5, right: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('image/close.png'))),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'To whom?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        margin: const EdgeInsets.all(50.0),
                        child: TextField(
                          controller: whomeController.textEditingController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: '',
                            hintText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          onChanged: (value) {
                            whomeController.textEditingController.value =
                                whomeController.textEditingController.value
                                    .copyWith(text: value);
                          },
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: Container(
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 20, bottom: 20),
                        child: Text(
                          "Pay",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      )),
                  onTap: () {
                    var payment2 = Payment(
                        name: whomeController.textEditingController.text.trim(),
                        amount: double.parse(payController.typnumber.value),
                        dateTime: DateTime.now(),
                        idtransaction: whomeController.random.nextInt(90000000),
                        idmerchant: whomeController.random.nextInt(9999),
                        pay: true);
                    whomeController.paymentList.add(payment2);

                    double value = double.parse(payController.typnumber.value);
                    homeController.countmoney.value =
                        homeController.countmoney.value - value;
                    whomeController.textEditingController.clear();
                    payController.typnumber.value = '';
                    Get.off(() => const HomeView());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
