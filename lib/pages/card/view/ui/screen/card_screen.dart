import 'package:bibimoney/app/view/ui/res/app_icons.dart';
import 'package:bibimoney/app/view/ui/res/colors.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/gradient_button.dart';
import 'package:bibimoney/app/view/ui/widget/second_app_bar.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final isVisible = MediaQuery.of(context).viewInsets == EdgeInsets.zero;

    return Scaffold(
      // todo
      appBar: SecondAppBar(
        title: _TitleAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            buildCard(),
            AppGradientButton(
              text: 'Сохранить карту',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          AppTitleTextField(
            title: 'Номер карты',
            hintText: '1234 5678 9012 3456',
          ),
          SizedBox(height: 24),
          AppTitleTextField(
            title: 'Имя владельца',
            hintText: 'Ivan Ivanov',
          ),
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              Container(
                width: 150,
                child: AppTitleTextField(
                  title: 'Срок действия',
                  hintText: '_ _  /  _ _',
                  suffixIcon: Icon(AppIcons.calendar),
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: 92,
                child: AppTitleTextField(
                  title: 'CVV',
                  hintText: '_ _ _',
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          AppIcons.sheild,
          color: AppColor.success,
        ),
        SizedBox(width: 8),
        Text(
          'Добавление карты',
          style: basic14bold.copyWith(color: AppColor.success),
        )
      ],
    );
  }
}
