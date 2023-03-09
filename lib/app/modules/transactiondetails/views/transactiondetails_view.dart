// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money/app/modules/home/controllers/home_controller.dart';
import 'package:money/app/modules/home/views/home_view.dart';
import 'package:money/app/modules/whome/controllers/whome_controller.dart';
import 'package:money/const.dart';

import '../controllers/transactiondetails_controller.dart';

class TransactiondetailsView extends GetView<TransactiondetailsController> {
  const TransactiondetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WhomeController whomeController = Get.put(WhomeController());
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: bColor,
        title: const Text('MoneyApp'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.to(() => HomeView());
          },
        ),
      ),
      backgroundColor: b2Color,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Positioned(
              top: 5,
              right: 10,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const Text(
              'MoneyApp',
              style: TextStyle(color: Colors.white),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: bColor,
                            ),
                            child: Icon(
                              whomeController
                                          .paymentList[whomeController.id.value]
                                          .pay ==
                                      true
                                  ? Icons.shopping_bag
                                  : Icons.add_circle,
                              size: 42.0,
                              color: Colors.white,
                            ),
                          ),
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: whomeController
                                        .paymentList[whomeController.id.value]
                                        .amount
                                        .toInt()
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 50.0),
                                  ),
                                  TextSpan(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    text: '.' +
                                        whomeController
                                            .paymentList[
                                                whomeController.id.value]
                                            .amount
                                            .toStringAsFixed(2)
                                            .split('.')[1],

                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 30.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        whomeController
                            .paymentList[whomeController.id.value].name,
                        style: const TextStyle(fontSize: 32),
                      ),
                      Text(whomeController.formatter.format(whomeController
                          .paymentList[whomeController.id.value].dateTime)),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: bColor,
                              borderRadius: BorderRadius.circular(4),
                              image: const DecorationImage(
                                  image: AssetImage('image/icon2.png'))),
                        ),
                        const Text(
                          '  Add Receipt',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        'SHARE THE COST',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (whomeController
                                .paymentList[whomeController.id.value].pay ==
                            true) {
                          var payment = Payment(
                              name: whomeController
                                  .paymentList[whomeController.id.value].name,
                              amount: whomeController
                                      .paymentList[whomeController.id.value]
                                      .amount /
                                  2,
                              pay: true,
                              dateTime: whomeController
                                  .paymentList[whomeController.id.value]
                                  .dateTime,
                              idtransaction: whomeController
                                  .paymentList[whomeController.id.value]
                                  .idtransaction,
                              idmerchant: whomeController
                                  .paymentList[whomeController.id.value]
                                  .idmerchant);
                          whomeController
                              .paymentList[whomeController.id.value] = payment;

                          final payment2 = Payment(
                              name: 'Top Up',
                              amount: whomeController
                                  .paymentList[whomeController.id.value].amount,
                              pay: false,
                              dateTime: DateTime.now(),
                              idtransaction:
                                  whomeController.random.nextInt(90000000),
                              idmerchant: whomeController.random.nextInt(9999));
                          whomeController.paymentList.add(payment2);
                          RxDouble sum = (homeController.countmoney.value +
                                  (whomeController
                                      .paymentList[whomeController.id.value]
                                      .amount))
                              .obs;
                          homeController.countmoney = sum;
                        }
                      },
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: bColor,
                                    borderRadius: BorderRadius.circular(4),
                                    image: const DecorationImage(
                                        image: AssetImage('image/icon1.png'))),
                              ),
                              const Text(
                                '  Split this bill',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        'SUBSCRIPTION',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '  Repeating payment',
                              style: TextStyle(fontSize: 18),
                            ),
                            Obx(
                              () => Switch(
                                value: homeController.switchvalue.value,
                                onChanged: (value) {
                                  if (whomeController
                                          .paymentList[whomeController.id.value]
                                          .pay ==
                                      true) {
                                    homeController.switchvalue.value =
                                        !homeController.switchvalue.value;
                                    if (homeController.switchvalue.value ==
                                        true) {
                                      final payment2 = Payment(
                                          name: whomeController
                                              .paymentList[
                                                  whomeController.id.value]
                                              .name,
                                          amount: whomeController
                                              .paymentList[
                                                  whomeController.id.value]
                                              .amount,
                                          pay: true,
                                          dateTime: DateTime.now(),
                                          idtransaction: whomeController.random
                                              .nextInt(90000000),
                                          idmerchant: whomeController.random
                                              .nextInt(9999));
                                      whomeController.paymentList.add(payment2);
                                      RxDouble sum = (homeController
                                                  .countmoney.value -
                                              whomeController
                                                  .paymentList[
                                                      whomeController.id.value]
                                                  .amount)
                                          .obs;
                                      homeController.countmoney = sum;
                                    } else {
                                      RxDouble sum = (homeController
                                                  .countmoney.value +
                                              whomeController
                                                  .paymentList[
                                                      whomeController.id.value]
                                                  .amount)
                                          .obs;
                                      homeController.countmoney = sum;
                                      whomeController.paymentList.removeLast();
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text('Help is on the way, stay put!'),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '  Something wrong? Get help',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                    'Transaction ID #${whomeController.paymentList[whomeController.id.value].idtransaction}',
                    style: const TextStyle(color: tColor)),
                Text(
                  '${whomeController.paymentList[whomeController.id.value].name} . Merchant ID #${whomeController.paymentList[whomeController.id.value].idmerchant}',
                  style: const TextStyle(color: tColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
