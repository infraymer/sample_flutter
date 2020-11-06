import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/add_bank_card_cell.dart';
import 'package:bibimoney/app/view/ui/widget/dropdown_widget.dart';
import 'package:bibimoney/app/view/ui/widget/empty_card.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:bibimoney/pages/payment/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SingingCharacter { defaultSumm, otherSumm, none }

class NewAutopayController extends GetxController {
  // Контроллер от Getx
  static NewAutopayController to = Get.find();

  // Выбранный тип платежа
  final selectedTypePayment = SingingCharacter.none.obs;

  // Выбранный элемент из выпадающего списка
  // obx отслеживает изменения переменной, а obs указывает, какую переменную отслеживать
  final selectedItem = SelectMenuItem(null, null).obs;

  List<SelectMenuItem> selectMenuItems = [
    SelectMenuItem(1, 'Займ от 7.07.2020'),
    SelectMenuItem(2, 'Займ от 6.06.2020'),
    SelectMenuItem(3, 'Займ от 5.05.2020'),
  ];

  void setTypePayment(SingingCharacter singingCharacter) {
    selectedTypePayment.value = singingCharacter;
  }
}

class NewAutopayScreen extends StatefulWidget {
  const NewAutopayScreen({Key key}) : super(key: key);

  @override
  _NewAutopayScreenState createState() => _NewAutopayScreenState();
}

class _NewAutopayScreenState extends State<NewAutopayScreen> {
  final _controller = NewAutopayController.to;

  List<DropdownMenuItem<SelectMenuItem>> buildDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<SelectMenuItem>> items = List();
    for (SelectMenuItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новый автоплатеж', style: basic14),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 0),
        child: Obx(() {
          final dropdownMenuItems =
              buildDropDownMenuItems(_controller.selectMenuItems);
          return ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 2.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: UiColors.main2,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: UiColors.border),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 24.0, 18.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Что оплачиваете', style: basic14),
                      SizedBox(height: 6.0),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownWidget(
                              onChange: (value) {
                                _controller.selectedItem.value = value;
                              },
                              selected:
                                  _controller.selectedItem.value.value == null
                                      ? null
                                      : _controller.selectedItem.value,
                              items: dropdownMenuItems,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              EmptyCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Тип платежа'),
                    SizedBox(height: 4.0),
                    RadioListWidget(),
                    if (_controller.selectedTypePayment.value ==
                        SingingCharacter.otherSumm)
                      Column(
                        children: <Widget>[
                          SizedBox(height: 18.0),
                          AppTitleTextField(
                            title: 'Сумма оплаты',
                            hintText: 'Сумма',
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '₽',
                                  style: additional14,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.0),
                          AppTitleTextField(
                            title: 'Когда оплачивать',
                            enabled: false,
                            hintText: 'Каждое 1-е число месяца',
                            suffixIcon: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      )
                    else
                      SizedBox(),
                  ],
                ),
              ),
              AddBankCardCell(
                iconData: UiIcons.card,
                title: 'Банковская карта',
                subtitle: 'Откуда ежемесячно будут списываться деньги',
                onPressed: () {
                  Get.to(PaymentScreen());
                },
              ),
              Container(
                width: double.infinity,
                child: AppAccentButton(
                  text: 'Подключить автоплатеж',
                  onPressed: () {},
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class RadioListWidget extends StatefulWidget {
  RadioListWidget({Key key}) : super(key: key);

  @override
  _RadioListWidgetState createState() => _RadioListWidgetState();
}

class _RadioListWidgetState extends State<RadioListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                width: 1,
                color: NewAutopayController.to.selectedTypePayment.value ==
                        SingingCharacter.defaultSumm
                    ? UiColors.accent
                    : UiColors.border),
          ),
          child: RadioListTile<SingingCharacter>(
            title: const Text('Согласно графику платежей', style: basic14),
            subtitle: Text('~8 500 ₽ в месяц', style: additional12),
            value: SingingCharacter.defaultSumm,
            groupValue: NewAutopayController.to.selectedTypePayment.value,
            onChanged: (SingingCharacter value) {
              NewAutopayController.to.selectedTypePayment(value);
            },
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                width: 1,
                color: NewAutopayController.to.selectedTypePayment.value ==
                        SingingCharacter.otherSumm
                    ? UiColors.accent
                    : UiColors.border),
          ),
          child: RadioListTile<SingingCharacter>(
            title: const Text('Другая сумма в месяц', style: basic14),
            value: SingingCharacter.otherSumm,
            groupValue: NewAutopayController.to.selectedTypePayment.value,
            onChanged: (SingingCharacter value) {
              NewAutopayController.to.selectedTypePayment(value);
            },
          ),
        ),
      ],
    );
  }
}
