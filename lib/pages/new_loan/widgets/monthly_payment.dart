import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/material.dart';

class MonthlyPayment extends StatelessWidget {
  final String price;
  const MonthlyPayment({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceCurrency = '${price ?? 0} ₽';
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(width: 1, color: UiColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(priceCurrency, style: heading1),
            Text('Ваш ежесячный платеж', style: basic14)
          ],
        ),
      ),
    );
  }
}
