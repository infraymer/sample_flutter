import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/app/view/ui/widget/title_text_field.dart';
import 'package:flutter/material.dart';

class CallMeScreen extends StatefulWidget {
  CallMeScreen({Key key}) : super(key: key);

  @override
  _CallMeScreenState createState() => _CallMeScreenState();
}

class _CallMeScreenState extends State<CallMeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Перезвоните мне', style: basic14)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            AppTitleTextField(
                title: 'Ваш номер', keyboardType: TextInputType.phone),
            SizedBox(
              height: 16,
            ),
            AppTitleTextField(
                title: 'Ваш вопрос',
                description: '(необязательно)',
                maxLines: 100),
            SizedBox(
              height: 16,
            ),
            Container(
                width: double.infinity,
                child:
                    AppAccentButton(onPressed: () {}, text: 'Отпавить заявку'))
          ]),
        ));
  }
}
