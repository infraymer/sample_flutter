import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: <Widget>[
              _Image(),
              SizedBox(width: 10),
              Expanded(child: _Info()),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.black12,
        )
      ],
    );
  }
}

class _Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 74,
        height: 74,
        child: Image.network(
          'https://cdn.pixabay.com/photo/2016/09/11/21/48/sand-1662630_1280.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Песок лесной, карьерный', style: basic14bold),
        SizedBox(height: 4),
        Text('24 500 ₽ • 24 тонн', style: basic14),
        SizedBox(height: 6),
        _Buttons(),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(4),
            child: Text('Посмотреть товар',
                style: basic14.copyWith(color: Theme.of(context).accentColor)),
          ),
        ),
        SizedBox(width: 16),
        // InkWell(
        //   onTap: () {},
        //   child: Container(
        //     padding: EdgeInsets.all(4),
        //     child: Text('Удалить', style: basic14.copyWith(color: Colors.red)),
        //   ),
        // )
      ],
    );
  }
}
