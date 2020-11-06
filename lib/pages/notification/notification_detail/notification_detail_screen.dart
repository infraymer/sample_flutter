import 'package:bibimoney/app/base/extensions/date_format.dart';
import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({Key key}) : super(key: key);

  @override
  _NotificationDetailScreenState createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('', style: basic14)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(AppDateFormat.notification.format(DateTime.now()),
                style: additional12),
            SizedBox(height: 8),
            Text(
                'Здравствуйте! Завтра последний день оплаты ежемесячного платежа. Если вы не внесёте оплату вам будут начислены проценты cогласно условию договора.',
                style: basic14),
            AppAccentButton(onPressed: () {}, text: 'Оплатить').paddingOnly(top: 16)
          ],
        ),
      ),
    );
  }
}
