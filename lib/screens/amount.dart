import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/controllers/my_money_controller.dart';
import 'package:money_app/controllers/my_text_controller.dart';
import 'package:money_app/models/money_model.dart';
import 'package:money_app/widgets/custom_button.dart';
import 'package:money_app/widgets/global_snack_bar.dart';
import 'package:money_app/widgets/keypad.dart';
import 'package:money_app/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class Amount extends StatefulWidget {
  @override
  _AmountState createState() => _AmountState();
}

class _AmountState extends State {
  MyTextController amountController = MyTextController();
  final now = DateTime.now();
  final myMoneyController = MyMoneyController.to;
  bool isTopUp = Get.arguments ?? false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Builder(
          builder: (context) => Column(
            children: [
              CustomAppBar(),
              Padding(
                padding: EdgeInsets.only(bottom: 40, top: 60),
                child: Text('How Much',
                    style: Theme.of(context).textTheme.headline1),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * .40,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: amountController,
                            readOnly: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              prefix: Text(
                                '\u{00A3}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 20),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: KeyPad(
                  amountController: amountController,
                  onChange: (String num) {
                    amountController.text = num;
                    // setState(() {});
                  },
                ),
              ),
              CustomButton(
                text: isTopUp ? 'Pay' : 'Next',
                onTap: () {
                  if (amountController.text == '') {
                    return GlobalSnackBar.show(
                        context, 'Please input an amount', 'Amount is empty');
                  }
                  if (isTopUp) {
                    myMoneyController
                        .incrementAmount(double.parse(amountController.text));
                    myMoneyController.addTransaction(
                      MoneyModel(
                        amount: double.parse(amountController.text),
                        isTopUp: isTopUp,
                        date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                      ),
                    );
                    Get.toNamed("/home");
                  } else {
                    Get.toNamed("/toWho", arguments: amountController.text);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
