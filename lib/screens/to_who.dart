import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/controllers/my_money_controller.dart';
import 'package:money_app/models/money_model.dart';
import 'package:money_app/widgets/custom_app_bar.dart';
import 'package:money_app/widgets/custom_button.dart';
import 'package:money_app/widgets/global_snack_bar.dart';
import 'package:intl/intl.dart';


class ToWho extends StatefulWidget {

  @override
  _ToWhoState createState() => _ToWhoState();
}

class _ToWhoState extends State<ToWho> {

  TextEditingController nameController = TextEditingController();
  final now = DateTime.now();
  final myMoneyController = MyMoneyController.to;
  String amount = Get.arguments;
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
                child: Text(
                    'To Who',
                    style: Theme.of(context).textTheme.headline1
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .80,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                fontSize: 40, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Theme.of(context).accentColor,
                  thickness: 4,
                ),
              ),
              SizedBox(height: 40,),
              CustomButton(
                text: 'Pay',
                onTap: () {
                  if (nameController.text == '') {
                    return GlobalSnackBar.show(
                        context, 'Please input a name', 'Name is empty');
                  }
                  myMoneyController.addTransaction(
                    MoneyModel(
                      amount: double.parse(amount),
                      date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                      name: nameController.text,
                    ),
                  );
                  myMoneyController
                      .decrementAmount(double.parse(amount));
                  Get.toNamed("/home");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
