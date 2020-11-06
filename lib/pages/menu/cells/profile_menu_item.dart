import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({Key key, this.phone, this.onTap}) : super(key: key);
  final String phone;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 23, 16, 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Ваш телефон', style: additional14),
            SizedBox(height: 13),
            Row(
              children: [
                Icon(UiIcons.user, color: UiColors.main1),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: Text('+792227814419', style: heading2))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
