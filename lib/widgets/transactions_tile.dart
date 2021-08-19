import 'package:flutter/material.dart';
import 'package:money_app/models/money_model.dart';

class TransactionTile extends StatelessWidget {
  final MoneyModel transaction;
  TransactionTile(this.transaction);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 22,
        height: 22,
        color: Theme.of(context).primaryColor,
        child: Icon(
          transaction.isTopUp ? Icons.add_circle_outline : Icons.shopping_bag,
          size: 16,
          color: Colors.white,
        ),
      ),
      title: Transform.translate(
          offset: Offset(-24, 0),
          child: Text(
            transaction.name!,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.bold),
          )),
      trailing: Text(
        transaction.isTopUp
            ? '+ ${transaction.amount.toStringAsFixed(2)}'
            : transaction.amount.toStringAsFixed(2),
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: 20,
            color: transaction.isTopUp
                ? Theme.of(context).primaryColor
                : Colors.black),
      ),
    );
  }
}
