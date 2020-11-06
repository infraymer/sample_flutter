import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/add_bank_card_cell.dart';
import 'package:bibimoney/pages/paymen_bank_card/payment_bank_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayMethodScreen extends StatelessWidget {
  const PayMethodScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Способ оплаты', style: basic14),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.to(PaymentBankCardScreen());
                },
                child: AddBankCardCell(
                  iconData: UiIcons.card,
                  title: 'Банковская карта',
                  subtitle: 'Получите деньги на вашу банковскую карту',
                ),
              ),
              SizedBox(height: 4.0),
              GestureDetector(
                onTap: () {
                  // Get.to(AddCardScreen());
                },
                child: AddBankCardCell(
                  iconData: UiIcons.database,
                  title: 'Наличными',
                  subtitle: 'В офисах нашей компании',
                ),
              ),
              // TODO: Добавить кнопки Google и Apple pay
            ],
          ),
        ),
      ),
    );
  }
}
