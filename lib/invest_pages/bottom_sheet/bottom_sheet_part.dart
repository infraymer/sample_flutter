import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/app/view/ui/widget/icon_container.dart';
import 'package:bibimoney/app/view/ui/widget/list_tile_widget.dart';
import 'package:bibimoney/pages/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetPart extends StatelessWidget {
  const BottomSheetPart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(ChatScreen());
          },
          child: AppListTileWidget(
            prefixWidget: AppIconContainerWidget(
              iconData: UiIcons.chat,
            ),
            textLeft: 'Написать в чат менеджеру',
            suffixWidget: SizedBox(),
            withBorders: false,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: AppListTileWidget(
            prefixWidget: AppIconContainerWidget(
              iconData: UiIcons.phone_call_1,
            ),
            textLeft: 'Заказать обратный звонок',
            suffixWidget: SizedBox(),
            withBorders: false,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: AppListTileWidget(
            prefixWidget: AppIconContainerWidget(
              iconData: UiIcons.phone,
            ),
            textLeft: '+7 (950) 085-74-58',
            suffixWidget: SizedBox(),
            withBorders: false,
          ),
        ),
      ],
    );
  }
}
