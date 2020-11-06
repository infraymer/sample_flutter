import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

import 'accent_button.dart';

class LoadingDataError extends StatelessWidget {
  final VoidCallback onUpdate;

  const LoadingDataError({Key key, this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Ошибка при загрузке', style: basic16),
          AppAccentButton(
            text: 'Обновить',
            onPressed: onUpdate,
          ).paddingOnly(top: 32),
        ],
      ),
    );
  }
}