import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/progress_widget.dart';
import 'package:bibimoney/app/view/ui/widget/simple_button.dart';
import 'package:bibimoney/app/view/ui/widget/status_widget/credit.dart';
import 'package:bibimoney/generated/graphql/api.graphql.dart';
import 'package:flutter/material.dart';

class LoanStatusWidget extends StatelessWidget {
  final CreditMixin credit;
  final Function onTap;
  const LoanStatusWidget({Key key, this.credit, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: UiColors.main2,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: UiColors.border),
          ),
          child: checkStatus(credit),
        ),
      ),
    );
  }

  Widget checkStatus(CreditMixin creditData) {
    switch (creditData.status) {
      case CreditStatusEnum.request:
        return buildCardData(credit);

      case CreditStatusEnum.approved:
        return buildCardData(credit);

      case CreditStatusEnum.waitUserConfirm:
        return buildCardData(credit);

      case CreditStatusEnum.issued:
        return buildCardData(credit);

      case CreditStatusEnum.paid:
        return buildCardData(credit);

      case CreditStatusEnum.denied:
        return buildCardData(credit);

      default:
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Text('Ошибка данных!'),
        );
    }
  }

  //////////

  Widget buildCardData(CreditMixin cardData) {
    Widget titleWidget = getTitleWidget(cardData.status);
    String loanDate = getLoanDate(cardData.createdAt);
    String text = getText(cardData.status);
    String btnOneText = _btnOneText[cardData.status];
    //Function btnOneFunc = cardData.btnOneFunc;
    String btnTwoText = _btnTwoText[cardData.status];
    //Function btnTwoFunc = cardData.btnTwoFunc;
    String payText = getPayText(cardData);
    String paySumm = getPaySumm(cardData);
    String maxSumm = getMaxSumm(cardData);
    int prosent = getProsent(cardData);
    String debt = getDebt(cardData);
    bool withArrow = cardData.status != CreditStatusEnum.denied;

    return _CardData(
      titleWidget: titleWidget,
      loanDate: loanDate,
      text: text,
      btnOneText: btnOneText,
      //btnOneFunc: btnOneFunc,
      btnTwoText: btnTwoText,
      //btnTwoFunc: btnTwoFunc,
      payText: payText,
      paySumm: paySumm,
      maxSumm: maxSumm,
      prosent: prosent,
      debt: debt,
      withArrow: withArrow,
    );
  }

  Widget getTitleWidget(CreditStatusEnum status) {
    switch (status) {
      case CreditStatusEnum.request:
        return Text(
          'НА РАССМОТРЕНИИ',
          style: additional12bold,
        );

      case CreditStatusEnum.approved:
        return Text(
          'ОДОБРЕНО',
          style: additional12bold.copyWith(color: UiColors.green),
        );

      case CreditStatusEnum.waitUserConfirm:
        return Text(
          'ОЖИДАНИЕ ПОДТВЕРЖДЕНИЯ',
          style: additional12bold.copyWith(color: UiColors.accent),
        );

      case CreditStatusEnum.paid:
        return Text(
          'ОПЛАЧЕН',
          style: additional12bold.copyWith(color: UiColors.green),
        );

      case CreditStatusEnum.denied:
        return Text(
          'ОТКАЗАНО',
          style: additional12bold.copyWith(color: UiColors.error),
        );

      default:
        return null;
    }
  }

  String getLoanDate(DateTime dateTime) {
    String loanDate = 'Договор от ' +
        dateTime.day.toString() +
        '.' +
        dateTime.month.toString() +
        '.' +
        dateTime.year.toString();
    return loanDate;
  }

  String getText(CreditStatusEnum status) {
    switch (status) {
      case CreditStatusEnum.request:
        return 'Мы свяжемся с вами в течение 15 минут';

      case CreditStatusEnum.approved:
        return 'Осталось подписать договор. Наш менеджер расскажет как это можно сделать. Если менеджер ещё не позвонил вам, вы можете связаться с нами сами.';

      case CreditStatusEnum.waitUserConfirm:
        return 'Мы одобрили вашу заявку. Вам осталось только подтвердить или отклонить статус заявки';

      case CreditStatusEnum.paid:
        return 'Поздравляем! Вы полностью оплатили текущий договор. Вы можете оформить новый по кнопке ниже';

      case CreditStatusEnum.denied:
        return 'К сожалению, ваша заявка была отклонена. Для дополнительной информации напишите нам в чат';

      default:
        return null;
    }
  }

  static const _btnOneText = {
    CreditStatusEnum.request: 'Загрузить фотографии',
    CreditStatusEnum.approved: 'Позвонить нам',
    CreditStatusEnum.waitUserConfirm: 'Позвонить нам',
    CreditStatusEnum.issued: 'Оплатить',
    CreditStatusEnum.paid: 'Оформить новый договор',
    CreditStatusEnum.denied: 'Написать в чат',
  };

  static const _btnTwoText = {
    CreditStatusEnum.approved: 'Написать в чат',
    CreditStatusEnum.waitUserConfirm: 'Отклонить',
    CreditStatusEnum.issued: 'Подключить автоплатеж',
  };

  String getPayText(CreditMixin data) {
    if (data.nextPaymentDate == null) {
      return 'Ошибка даты!';
    }
    return 'Ежемесячный платёж до ' +
        data.nextPaymentDate.day.toString() +
        ' ' +
        getPayTextMonth(data.nextPaymentDate.month);
  }

  String getPayTextMonth(int month) {
    switch (month) {
      case 1:
        return 'января';
      case 2:
        return 'февраля';
      case 3:
        return 'марта';
      case 4:
        return 'апреля';
      case 5:
        return 'мая';
      case 6:
        return 'июня';
      case 7:
        return 'июля';
      case 8:
        return 'августа';
      case 9:
        return 'сентября';
      case 10:
        return 'октября';
      case 11:
        return 'ноября';
      case 12:
        return 'декабря';
      default:
        return null;
    }
  }

  String getPaySumm(CreditMixin data) {
    if (data.sum == null) {
      return '';
    }

    int sum = data.nextPaymentSum?.toInt() ?? 0;
    return sum.toString() + ' ₽';
  }

  String getMaxSumm(CreditMixin data) {
    if (data.sum == null) {
      return '';
    }

    int sum = data.sum?.toInt() ?? 0;
    return sum.toString() + ' ₽';
  }

  int getProsent(CreditMixin data) {
    // TODO: Рассчитать процент (перебирать все платежи?)
    return 30;
  }

  String getDebt(CreditMixin data) {
    if (data.otherPayments == null) {
      return null;
    }
    int debt = data.otherPayments?.toInt() ?? 0;
    return debt.toString() + ' ₽';
  }
}

//////////

class _CardData extends StatelessWidget {
  final Widget titleWidget;
  final String loanDate;
  final String text;
  final String btnOneText;
  final Function btnOneFunc;
  final String btnTwoText;
  final Function btnTwoFunc;
  final String payText;
  final String paySumm;
  final String maxSumm;
  final int prosent;
  final String debt;
  final bool withArrow;

  const _CardData({
    Key key,
    this.titleWidget,
    this.loanDate,
    this.text,
    this.btnOneText,
    this.btnOneFunc,
    this.btnTwoText,
    this.btnTwoFunc,
    this.payText,
    this.paySumm,
    this.maxSumm,
    this.prosent,
    this.debt,
    this.withArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 24.0, 18.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget ?? SizedBox(),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                loanDate,
                style: basic16.copyWith(decoration: TextDecoration.underline),
              ),
              withArrow
                  ? Row(
                      children: <Widget>[
                        Icon(
                          UiIcons.arrow,
                          color: UiColors.placeholder,
                        ),
                        SizedBox(width: 9.0),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
          text != null ? SizedBox(height: 11.0) : SizedBox(),
          text != null
              ? Text(
                  text,
                  style: basic14,
                )
              : SizedBox(),
          text == null ? SizedBox(height: 16.0) : SizedBox(),
          text == null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    debt != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Задолженность',
                                style: additional14,
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                debt,
                                style: basic16.copyWith(color: UiColors.error),
                              ),
                              SizedBox(height: 12.0),
                            ],
                          )
                        : SizedBox(),
                    Text(
                      payText,
                      style: additional14,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      paySumm,
                      style: basic16,
                    ),
                    SizedBox(height: 16.0),
                    ProgressWidget(prosent: prosent),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '0 ₽',
                          style: additional12,
                        ),
                        Text(
                          maxSumm,
                          style: additional12,
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(),
          SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              SimpleButton(
                text: btnOneText,
                onPressed: btnOneFunc,
              ),
              SizedBox(width: 12.0),
              btnTwoText != null
                  ? Expanded(
                      child: SimpleButton(
                        text: btnTwoText,
                        onPressed: btnTwoFunc,
                        isTransparent: true,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
