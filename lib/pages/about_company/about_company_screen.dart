import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/document_widget.dart';
import 'package:flutter/material.dart';

class AboutCompanyScreen extends StatelessWidget {
  const AboutCompanyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('О компании', style: basic14)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          _buildTitle(),
          _buildStaff(),
          _buildAboutUs(),
          _buildTerms(),
          _buildDocuments(),
          _buildContacts()
        ]),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(children: [
      Image.asset('assets/images/about_company.png'),
      SizedBox(height: 24),
      Text(
          'Мы команда «БиБи Мани» помогаем людям которым срочно требуются деньги на разные нужды.',
          textAlign: TextAlign.center,
          style: basic14)
    ]);
  }

  Widget _buildStaff() {
    return Column(children: [
      Divider(),
      _StaffWidget(
        quote:
            '«Я хочу чтобы клиент мог получить деньги не отрываясь от своих дел.» ',
        name: 'Вопилов Павел',
        position: 'Генеральный директор «БиБи Мани»',
        imageUrl:
            'https://hsto.org/getpro/habr/post_images/00d/82c/9f0/00d82c9f0493753597cfac97b4712b8f.png',
      ),
      Divider(),
    ]);
  }

  Widget _buildAboutUs() {
    final items = [
      InfoAboutCompanyItem(
          iconData: UiIcons.stonk, text: 'Работаем с 2015 года'),
      InfoAboutCompanyItem(
          iconData: UiIcons.shonk1, text: 'Выдали более 10 000 займов'),
      InfoAboutCompanyItem(
          iconData: UiIcons.smile, text: '90% довольных клиентов')
    ];
    return _InfoAboutCompanyWidget(
      title: 'О нас в цифрах',
      items: items,
    );
  }

  Widget _buildTerms() {
    final items = [
      InfoAboutCompanyItem(
          iconData: UiIcons.check_circle,
          text: 'Оцениваем 90% от рыночной стоимости автомобиля'),
      InfoAboutCompanyItem(
          iconData: UiIcons.check_circle,
          text: 'До 70% от оценочной стоимости авто'),
      InfoAboutCompanyItem(
          iconData: UiIcons.check_circle,
          text: 'Без комиссий и дополнительных пакетов'),
      InfoAboutCompanyItem(
          iconData: UiIcons.check_circle,
          text: 'Автомобиль остается у владельца')
    ];
    return _InfoAboutCompanyWidget(
      title: 'Условия',
      items: items,
    );
  }

  Widget _buildDocuments() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Документы', style: basic14bold),
      SizedBox(height: 12),
      DocumentWidget(
        name: 'Соглашение об электронном взаимодействии',
        sizeDoc: '140кб',
        typeDoc: 'doc',
      ),
      DocumentWidget(
        name: 'Соглашение об электронном взаимодействии',
        sizeDoc: '140кб',
        typeDoc: 'doc',
      ),
      DocumentWidget(
        name: 'Соглашение об электронном взаимодействии',
        sizeDoc: '140кб',
        typeDoc: 'doc',
      )
    ]);
  }

  Widget _buildContacts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        _Contact(
          title: 'Головной офис',
          contacts: ['Иркутск, ул. Фурье, 1Г'],
        ),
        _Contact(
          title: 'Приемная:',
          contacts: ['8 (3952) 74-92-12', '8 (3955) 63-11-55'],
        ),
        _Contact(
          title: 'Напишите нам:',
          contacts: ['info@bbmoney.ru'],
        ),
        _Contact(
          title: 'График работы',
          contacts: ['Понедельник–пятница,', '10:00–18:00'],
        ),
        _Contact(
          title: 'По вопросам рекламы:',
          contacts: ['adv@bbmoney.ru'],
        ),
      ],
    );
  }
}

class _Contact extends StatelessWidget {
  final String title;
  final List<String> contacts;
  const _Contact({Key key, this.title, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(title, style: basic14bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                contacts.length,
                (index) => Text(
                      contacts[index],
                      style: basic14,
                    )),
          )
        ],
      ),
    );
  }
}

class _StaffWidget extends StatelessWidget {
  final String quote;
  final String name;
  final String position;
  final String imageUrl;
  const _StaffWidget(
      {Key key, this.quote, this.name, this.position, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(52 / 2),
                child: Image.network(
                  imageUrl,
                  height: 52,
                  width: 52,
                  fit: BoxFit.cover,
                )),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(quote, style: basic14),
                  SizedBox(height: 12),
                  Text(name, style: basic12),
                  Text(position, style: additional12)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoAboutCompanyItem {
  final IconData iconData;
  final String text;

  InfoAboutCompanyItem({@required this.iconData, @required this.text});
}

class _InfoAboutCompanyWidget extends StatelessWidget {
  final String title;
  final List<InfoAboutCompanyItem> items;
  const _InfoAboutCompanyWidget({Key key, this.title, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: basic14bold),
        SizedBox(height: 7),
        Column(
            children: List.generate(
                items.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(items[index].iconData,
                              size: 36, color: UiColors.accentActive),
                          SizedBox(
                            width: 17,
                          ),
                          Expanded(
                              child: Text(items[index].text, style: basic16))
                        ],
                      ),
                    )))
      ]),
    );
  }
}
