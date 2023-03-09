import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money/app/modules/home/controllers/home_controller.dart';
import 'package:money/app/modules/home/views/home_view.dart';
import 'package:money/app/modules/whome/controllers/whome_controller.dart';
import 'package:money/const.dart';

import '../controllers/loan_controller.dart';

class LoanView extends GetView<LoanController> {
  const LoanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoanDecisionService loanDecisionService = LoanDecisionService();
    LoanController loanController = Get.put(LoanController());
    HomeController homeController = Get.put(HomeController());
    WhomeController whomeController = Get.put(WhomeController());
    return Scaffold(
      backgroundColor: b2Color,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => const HomeView());
          },
        ),
        title: const Text('Loan Application'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Terms and Conditions\n",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum enim non neque luctus, nec blandit ipsum sagittis. Sed fringilla blandit nibh, sit amet suscipit massa sollicitudin lacinia. Donec cursus, odio sit amet tincidunt sodales, odio nisl hendrerit sem, tempor tincidunt ligula nisl nec ante. Nulla aliquet aliquam justo, ac bibendum orci rhoncus non. Nullam quis ex elementum, pharetra ligula eleifend, convallis nulla. Nulla sit amet nisi viverra, semper nunc eu, posuere dui. Donec at metus ut eros rhoncus vestibulum vitae at lacus. Etiam imperdiet, nulla ac condimentum aliquam, enim lacus fringilla leo, vel hendrerit mi ipsum et ante. Vivamus finibus mauris eget diam sodales, eget efficitur orci laoreet. Sed feugiat odio quis mattis tristique. Mauris sit amet sem mauris.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
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
                            '  Accept Terms & Conditions',
                            style: TextStyle(fontSize: 18),
                          ),
                          Obx(() => Switch(
                                value: loanController.switchvalue.value,
                                onChanged: (value) {
                                  loanController.switchvalue.value =
                                      !loanController.switchvalue.value;
                                },
                              ))
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
                          'ABOUT YOU',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          loanController.textcontrollers.clear();
                          Get.dialog(AlertDialog(
                            title: const Text('Monthly Salary'),
                            content: TextFormField(
                              controller: loanController.textcontrollers,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  String text = loanController
                                      .textcontrollers.text
                                      .trim();
                                  int montlyresult = int.tryParse(text) ?? 0;

                                  loanController.monthly.value = montlyresult;

                                  Get.back();
                                },
                              ),
                            ],
                          ));
                        },
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            title: const Text(
                              'Monthly Salary',
                              style: TextStyle(color: tColor),
                            ),
                            subtitle: Obx(
                              () => Text(
                                '£ ${loanController.monthly.value}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          loanController.textcontrollers.clear();
                          Get.dialog(AlertDialog(
                            title: const Text('Monthly Expenses'),
                            content: TextFormField(
                              controller: loanController.textcontrollers,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  String text = loanController
                                      .textcontrollers.text
                                      .trim();
                                  int montlyresult = int.tryParse(text) ?? 0;

                                  controller.mexpenses.value = montlyresult;

                                  Get.back();
                                },
                              ),
                            ],
                          ));
                        },
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            title: const Text(
                              'Monthly Expenses',
                              style: TextStyle(color: tColor),
                            ),
                            subtitle: Obx(
                              () => Text(
                                '£ ${controller.mexpenses.value}',
                                style: const TextStyle(color: Colors.black),
                              ),
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
                          'LOAN',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          loanController.textcontrollers.clear();
                          Get.dialog(AlertDialog(
                            title: const Text('Amount'),
                            content: TextFormField(
                              controller: loanController.textcontrollers,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  String text = loanController
                                      .textcontrollers.text
                                      .trim();
                                  int montlyresult = int.tryParse(text) ?? 0;

                                  controller.amount.value = montlyresult;

                                  Get.back();
                                },
                              ),
                            ],
                          ));
                        },
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            title: const Text(
                              'Amount',
                              style: TextStyle(color: tColor),
                            ),
                            subtitle: Obx(
                              () => Text(
                                '£ ${loanController.amount.value}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          loanController.textcontrollers.clear();
                          Get.dialog(AlertDialog(
                            title: const Text('Term'),
                            content: TextFormField(
                              controller: loanController.textcontrollers,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  String text = loanController
                                      .textcontrollers.text
                                      .trim();
                                  int montlyresult = int.tryParse(text) ?? 0;

                                  loanController.term.value = montlyresult;
                                  //         loanController.textcontrollers.value = montlyresult.toSt;
                                  Get.back();
                                },
                              ),
                            ],
                          ));
                        },
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            title: const Text(
                              'Term',
                              style: TextStyle(color: tColor),
                            ),
                            subtitle: Obx(
                              () => Text(
                                '${loanController.term.value}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      child: Container(
                          margin: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: bColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 50, right: 50, top: 20, bottom: 20),
                            child: Text(
                              "Apply for loan",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          )),
                      onTap: () async {
                        if (loanController.hasApplied == false) {
                          final loanDecision =
                              await loanDecisionService.generateLoanDecision(
                                  loanController.monthly.value,
                                  loanController.mexpenses.value,
                                  loanController.amount.value,
                                  loanController.term.value,
                                  homeController.countmoney.value);
                          loanController.hasApplied = true;
                          if (loanDecision == 'APPROVED') {
                            Get.dialog(
                              AlertDialog(
                                title: const Text(
                                  'APPROVED ',
                                  style: TextStyle(color: Colors.green),
                                ),
                                content: const Text(
                                    'Yeeeyyy !! Congrats. Your application has been approved. Don’t tell your friends you have money!'),
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
                            final payment = Payment(
                                name: 'Loan',
                                amount: loanController.amount.value.toDouble(),
                                pay: false,
                                dateTime: DateTime.now(),
                                idtransaction:
                                    whomeController.random.nextInt(90000000),
                                idmerchant:
                                    whomeController.random.nextInt(9999));
                            whomeController.paymentList.add(payment);
                          } else if (loanDecision == 'DECLINED') {
                            loanController.newdecision = true;
                            Get.dialog(
                              AlertDialog(
                                title: const Text(
                                  'DECLINED',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: const Text(
                                    'Ooopsss. Your application has been declined. It’s not your fault, it’s a financial crisis. '),
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
                          } else if (loanDecision == 'DECLINEDTOAPPROVED') {
                            loanController.newdecision = true;
                            Get.dialog(
                              AlertDialog(
                                title: const Text(
                                  'DECLINED',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: const Text(
                                    'Ooopsss. Your application has been declined. It’s not your fault, it’s a financial crisis. '),
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
                          }
                        } else {
                          Get.dialog(
                            AlertDialog(
                              title: const Text(
                                  'Ooopsss, you applied before. Wait for notification from us'),
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
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
