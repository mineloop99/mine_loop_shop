import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionsList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, contraints) {
              return Column(
                children: [
                  Text(
                    'No Transaction added yet!',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Container(
                    height: contraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((e) => TransactionItem(
                      key: ValueKey(e.id),
                      transaction: e,
                      deleteTx: deleteTx,
                    ))
                .toList());
  }
}
