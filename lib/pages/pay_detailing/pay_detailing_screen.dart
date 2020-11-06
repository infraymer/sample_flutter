import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/pages/pay_detailing/pay_detailing_data.dart';
import 'package:flutter/material.dart';

class PayDetailing extends StatefulWidget {
  @override
  _PayDetailingState createState() => _PayDetailingState();
}

class _PayDetailingState extends State<PayDetailing> {
  PayData payData = PayData(
    loanDate: '7 августа',
    payDate: '7 ноября',
    standartPay: '8 500 ₽',
    finePay: '274 ₽',
    total: '8 774 ₽',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payData.loanDate, style: basic14),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 22.0, 16.0, 22.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Дата платежа: ', style: basic16),
                  Text(payData.payDate,
                      style: basic16.copyWith(color: UiColors.error)),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Сумма по графику', style: basic16),
                  Text(payData.standartPay, style: basic16),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Штраф', style: basic16),
                  Text(payData.finePay, style: basic16),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Итого', style: basic16bold),
                  Text(payData.total, style: basic16bold),
                ],
              ),
              SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                child: AppAccentButton(
                  text: 'Оплатить ' + payData.total,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
