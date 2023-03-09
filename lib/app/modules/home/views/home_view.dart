import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/app/modules/transactiondetails/views/transactiondetails_view.dart';
import 'package:money/app/modules/whome/controllers/whome_controller.dart';
import 'package:money/const.dart';

import '../controllers/home_controller.dart';

List menu = ['Pay', 'Top up', 'Loan'].obs;
List iconMenu = [
  'image/phone_icon.png',
  'image/wallet_icon.png',
  'image/loan_icon.png',
];

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    WhomeController whomeController = Get.put(WhomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 250,
                      color: bColor,
                    ),
                    Container(
                      height: 100,
                      color: b2Color,
                    ),
                  ],
                ),
                const Positioned(
                    top: 2,
                    child: Text(
                      'MoneyApp',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    )),
                Positioned(
                  top: 90.0,
                  child: Obx(
                    () => RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '£',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: homeController.countmoney.toInt().toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 50.0),
                          ),
                          TextSpan(
                            text:
                                '.${homeController.countmoney.toStringAsFixed(2).split('.')[1]}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 5,
                  left: 20,
                  child: Text(
                    'Recent Activity',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 0.5,
                            offset: Offset(0.0, 0.15),
                            spreadRadius: 0.1)
                      ],
                      color: Colors.white,
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    homeController.goToPay();
                                  } else if (index == 1) {
                                    homeController.goTopUp();
                                  } else if (index == 2) {
                                    homeController.goToLoan();
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(iconMenu[index]))),
                                    ),
                                    Text(menu[index]),
                                  ],
                                ),
                              )),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        color: b2Color,
                        width: MediaQuery.of(context).size.width,
                        child: const Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          child: Text(
                            'TODAY',
                            style: TextStyle(color: tColor),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          margin:
                              const EdgeInsets.only(left: 12.0, right: 20.0),
                          child: Column(
                            children: whomeController.paymentList.reversed
                                .map((item) {
                              int index =
                                  whomeController.paymentList.indexOf(item);

                              return GestureDetector(
                                  onTap: () {
                                    whomeController.id.value = index;
                                    homeController.switchvalue.value = false;
                                    Get.to(
                                        () => const TransactiondetailsView());
                                  },
                                  child: ListTile(
                                    leading: Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: bColor),
                                      child: Icon(
                                        whomeController
                                                    .paymentList[index].pay !=
                                                false
                                            ? Icons.shopping_bag
                                            : Icons.add_circle,
                                        color: b2Color,
                                      ),
                                    ),
                                    title: Text(
                                      whomeController.paymentList[index].name,
                                      style: const TextStyle(
                                          fontSize: 16, color: textColor),
                                    ),
                                    trailing: Text(
                                      whomeController.paymentList[index].pay !=
                                              false
                                          ? whomeController
                                              .paymentList[index].amount
                                              .toStringAsFixed(2)
                                          : '+${whomeController.paymentList[index].amount.toStringAsFixed(2)}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: whomeController
                                                    .paymentList[index].pay ==
                                                true
                                            ? Colors.black
                                            : bColor,
                                      ),
                                    ),
                                  ));
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        color: b2Color,
                        width: MediaQuery.of(context).size.width,
                        child: const Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          child: Text(
                            'YESTERDAY',
                            style: TextStyle(color: tColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12.0, right: 20.0),
                        child: Column(children: const [
                          Text(''),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
