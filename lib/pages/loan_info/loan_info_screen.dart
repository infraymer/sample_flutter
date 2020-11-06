import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/title_loan_info.dart';
import 'package:flutter/material.dart';

class LoanInfo extends StatelessWidget {
  const LoanInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: TitleLoanInfo(
              amount: '100 000',
              term: '6',
              monthlyPayment: '8 500',
            ),
          ),
          _PayListWidget(),
        ],
      ),
    );
  }
}

class _PayListWidget extends StatefulWidget {
  _PayListWidget({Key key}) : super(key: key);

  @override
  _PayListWidgetState createState() => _PayListWidgetState();
}

class _PayListWidgetState extends State<_PayListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 29.0, 16.0, 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 20.0),
              Text(
                'Рекомендуемая \nдата погашения',
                style: basic12.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Сумма \nк оплате, ₽',
                style: basic12.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Остаток \nдолга, ₽',
                style: basic12.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          // TODO: Их надо как-то оформить в ListView (не получилось) (можно через builder)
          _PayListElement(
            checked: true,
            recommendedDate: '7 октября',
            paySumm: '8 500',
            remainder: '77 600',
          ),
          _PayListElement(
            isDebt: true,
            recommendedDate: '7 ноября',
            paySumm: '8 784',
            remainder: '69 100',
          ),
          _PayListElement(
            recommendedDate: '7 декабря',
            paySumm: '8 500',
            remainder: '60 600',
          ),
          _PayListElement(
            recommendedDate: '7 января, \n2021',
            paySumm: '8 500',
            remainder: '52 100',
          ),
        ],
      ),
    );
  }
}

class _PayListElement extends StatelessWidget {
  final bool checked;
  final bool isDebt;
  final String recommendedDate;
  final String paySumm;
  final String remainder;

  const _PayListElement({
    Key key,
    this.checked = false,
    this.isDebt = false,
    this.recommendedDate,
    this.paySumm,
    this.remainder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          checked
              ? Icon(UiIcons.check_circle, color: UiColors.green)
              : Image.asset('assets/images/unchecked.png'),
          Text(
            recommendedDate,
            style: isDebt ? basic12.copyWith(color: UiColors.error) : basic12,
          ),
          Text(
            paySumm,
            style: isDebt ? basic12.copyWith(color: UiColors.error) : basic12,
          ),
          Text(
            remainder,
            style: isDebt
                ? basic12.copyWith(color: UiColors.error)
                : checked
                    ? basic12.copyWith(decoration: TextDecoration.lineThrough)
                    : basic12,
          ),
        ],
      ),
    );
  }
}
