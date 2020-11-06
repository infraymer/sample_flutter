import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';

class HistoryItem {
  final DateTime date;
  final String amount;

  HistoryItem({
    this.date,
    this.amount,
  });
}

class PaymentHistoryScreen extends StatefulWidget {
  PaymentHistoryScreen({Key key}) : super(key: key);

  @override
  _PaymentHistoryScreenState createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  final data = [
    HistoryItem(date: DateTime.now(), amount: '100'),
    HistoryItem(date: DateTime.now(), amount: '100')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => PaymentHistoryCell(
              date: data[index].date, amount: data[index].amount)),
    );
  }
}

class PaymentHistoryCell extends StatelessWidget {
  final DateTime date;
  final String amount;

  const PaymentHistoryCell({Key key, this.date, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMMM, yyyy года. hh:mm');
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: UiColors.border))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text(dateFormat.format(this.date), style: basic14)),
            Text('+$amount ₽', style: basic14.copyWith(color: UiColors.green))
          ],
        ),
      ),
    );
  }
}
