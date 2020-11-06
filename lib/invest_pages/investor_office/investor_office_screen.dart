import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/empty_card.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/simple_button.dart';
import 'package:bibimoney/invest_pages/about_investment/about_investment_screen.dart';
import 'package:bibimoney/invest_pages/topup_investments/topup_investments_screen.dart';
import 'package:bibimoney/pages/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvestorOfficeScreen extends StatefulWidget {
  InvestorOfficeScreen({Key key}) : super(key: key);

  @override
  _InvestorOfficeScreenState createState() => _InvestorOfficeScreenState();
}

class _InvestorOfficeScreenState extends State<InvestorOfficeScreen> {
  @override
  Widget build(BuildContext context) {
    return buildTree();
  }

  Widget buildTree() {
    return Scaffold(
      backgroundColor: UiColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: ListView(
            children: [
              buildCard1(),
              buildCard2(),
              buildCard3(),
              buildCard4(),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: RichText(
                  text: TextSpan(
                    style: additional12,
                    children: [
                      TextSpan(text: '* Сумма дохода указана без учёта '),
                      TextSpan(
                        text: '13% НФДЛ',
                        style: additional12.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  EmptyCard buildCard1() {
    return EmptyCard(
      child: Row(
        children: [
          Expanded(child: Text('Заработок за все время', style: basic14)),
          Text(
            '548 341 ₽',
            style: basic16bold.copyWith(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  Widget buildCard2() {
    return EmptyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Ежемесячная выплата',
            style: additional14,
          ),
          SizedBox(height: 10),
          Text(
            '5 485 ₽',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Поступит на ваш счет с 2-5 августа',
            style: additional14,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          ProgressWidget(
            prosent: 10,
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('5 485 ₽', style: additional12),
              Text('65 820 ₽', style: additional12),
            ],
          ),
        ],
      ),
    );
  }

  EmptyCard buildCard3() {
    return EmptyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(AboutInvestmentScreen());
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Инвестиция от 14 июня, 2020',
                    style: basic16.copyWith(
                      color: UiColors.accentActive,
                    ),
                  ),
                ),
                Icon(UiIcons.arrow, color: UiColors.accentActive),
              ],
            ),
          ),
          Text(
            'Конец срока 14 июля, 2021',
            style: additional14,
          ),
          SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text('Инвестировано')),
              Expanded(child: Text('Процентная ставка')),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Expanded(child: Text('100 000 ₽', style: basic14bold)),
              Expanded(child: Text('30% годовых', style: basic14bold)),
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            child: AppAccentButton(
              text: 'Пополнить инвестиции',
              onPressed: () {
                Get.to(TopupIvestmentsScreen());
              },
            ),
          ),
        ],
      ),
    );
  }

  EmptyCard buildCard4() {
    return EmptyCard(
      withPadding: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 24.0, 18.0, 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Нужна помощь?', style: basic16),
                  SizedBox(height: 6.0),
                  Text(
                    'Напишите нашему менеджеру в чат',
                    style: additional14,
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    width: double.infinity,
                    child: SimpleButton(
                      text: 'Написать',
                      onPressed: () {
                        Get.to(ChatScreen());
                      },
                      isTransparent: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Image.asset('assets/images/lifebuoy.png'),
          ),
        ],
      ),
    );
  }
}
