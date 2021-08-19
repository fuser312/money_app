import 'package:flutter/material.dart';
import 'package:money_app/controllers/my_money_controller.dart';
import 'package:money_app/models/money_model.dart';
import 'package:money_app/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import "package:collection/collection.dart";
import 'package:money_app/widgets/transactions_tile.dart';

class Home extends StatelessWidget {
  final myMoneyController = MyMoneyController.to;
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Map<String, List<MoneyModel>> groupByDate = groupBy(myMoneyController.recentActivity.reversed,
        (MoneyModel moneyModel) => moneyModel.date.substring(0, 10));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffd2cad3),
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .35,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      CustomAppBar(
                        isHome: true,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\u{00A3}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20),
                          ),
                          Obx(
                            () => Text(
                              myMoneyController.finalAmount.value.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 8),
                  child: Text(
                    "Recent Activity", style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold)
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: groupByDate.entries.length,
                    itemBuilder: (_, index) {
                      final data = groupByDate.entries.toList()[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 8, bottom: 8),
                            child: Text(getDate(data.key), style: TextStyle(fontSize: 14, color: Colors.grey),),
                          ),
                          Container(
                            color: Theme.of(context).accentColor,
                            child: Column(
                              children: [
                                for (final value in data.value)
                                  TransactionTile(value),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * .52,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/amount", arguments: false);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_iphone_outlined,
                            size: 48,
                          ),
                          Text(
                            "Pay",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/amount", arguments: true);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 48,
                          ),
                          Text(
                            "Top up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  String getDate(String date){
    if(DateTime.parse(date) == DateTime(now.year, now.month, now.day)){
      return 'TODAY';
    }
    if(DateTime.parse(date) == DateTime(now.year, now.month, now.day - 1)){
      return 'YESTERDAY';
    }
    return date;
  }
}
