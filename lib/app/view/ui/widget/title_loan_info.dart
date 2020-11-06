import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

class TitleLoanInfo extends StatelessWidget {
  final String amount;
  final String term;
  final String monthlyPayment;
  final EdgeInsets padding;
  const TitleLoanInfo(
      {Key key, this.amount, this.term, this.monthlyPayment, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: UiColors.border))),
      child: Padding(
        padding: padding ?? EdgeInsets.only(top: 24, bottom: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text('Сумма денег $amount ₽', style: basic14bold)
              .paddingOnly(bottom: 6),
          Text('Срок: $term месяцев', style: basic14).paddingOnly(bottom: 6),
          Text('Ежемесячный платеж: $monthlyPayment ₽', style: basic14),
        ]),
      ),
    );
  }
}
