import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyOrdersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(child: SvgPicture.asset('assets/images/empty_orders.svg')),
        Center(
          // TODO: Или завершенных заказов (зависит от выбранной опции выше в дереве)
          child: Text(
            'У вас пока нет активных заказов',
            style: basic16,
          ),
        ),
      ],
    );
  }
}
