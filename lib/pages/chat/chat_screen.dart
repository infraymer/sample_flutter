import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Чат с менеджером', style: basic14)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: <Widget>[
                  DateItemOfChat(
                    date: 'Сегодня 14, июля',
                  ),
                  Message(),
                  OwnerMessage(),
                ],
              ),
            ),
          ),
          _InputMessage(),
        ],
      ),
    );
  }
}

class DateItemOfChat extends StatelessWidget {
  final String date;
  const DateItemOfChat({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        child: Text(
          date,
          style: additional14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OwnerMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('15:08', style: additional12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: UiColors.accent.withAlpha(50),
                      borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                              'Здравствуйте! Я менеджер компании БиБи.Мани. Я могу ответить на ваши вопросы. Подскажите, что вас интересует?',
                              style: basic14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text('Добавлнено, не просмотренно', style: additional12)
      ],
    );
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 11),
              child: Container(
                decoration: BoxDecoration(
                    color: UiColors.background,
                    borderRadius: BorderRadius.circular(16)),
                // margin: EdgeInsets.all(8),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(8),
                // ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            'Здравствуйте! Я менеджер компании БиБи.Мани. Я могу ответить на ваши вопросы. Подскажите, что вас интересует?',
                            style: basic14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text('14:27', style: additional12),
        ],
      ),
    );
  }
}

class _InputMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      margin: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Сообщение...'),
              ),
            ),
            IconButton(
              icon: Icon(UiIcons.attach),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
