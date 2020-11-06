import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';

class MaterialItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const MaterialItemWidget({
    Key key,
    this.title,
    this.subtitle,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: <Widget>[
              _Image(imageUrl),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title ?? '', style: basic14bold),
                    SizedBox(height: 4),
                    Text(subtitle ?? '', style: basic14),
                    SizedBox(height: 6),
                  ],
                ),
              ),
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
  final String imageUrl;

  const _Image(this.imageUrl, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 74,
        height: 74,
        child: Image.network(
          imageUrl ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
