import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/invest_pages/tabs_screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 35.0),
          child: Container(
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset('assets/images/greeting1.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Обращение генерального директора',
                        style: basic14bold,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '«Здравствуйте! Меня зовут Павел Вопилов, я генеральный директор компании БиБи. Мы рады что вас заинтересовал наш проект.',
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'За июнь 2020-го года мы выдали займов на 7 миллионов рублей, а могли на 12. Спрос на наши услуги растёт каждый месяц и мы хотим его покрывать. Для этого мы открыты к инвестициям которые помогут нам масштабировать наш бизнес, а вам зарабатывать на этом деньги.',
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Мы всячески открыты к сотрудничеству и готовы поделиться всей нужной информацией которая поможет вам принять решения»',
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset('assets/images/greeting2.png'),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  child: AppAccentButton(
                    text: 'Начать',
                    onPressed: () {
                      Get.to(TabsScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
