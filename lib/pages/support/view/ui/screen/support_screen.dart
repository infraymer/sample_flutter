import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/widget/accent_button.dart';
import 'package:bibimoney/pages/call_me/call_me_screen.dart';
import 'package:bibimoney/pages/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 100),
          Text(
              'Ответим на ваши вопросы с 10:00–18:00. \nС понедельника по пятницу',
              textAlign: TextAlign.center,
              style: basic16),
          SizedBox(height: 24),
          Container(
              width: double.infinity,
              child: AppAccentButton(
                onPressed: () {
                  Get.to(ChatScreen());
                },
                text: 'Чат с менеджером',
              )),
          // SizedBox(height: 14),
          Container(
              width: double.infinity,
              child: AppAccentButton(
                  onPressed: () {
                    Get.to(CallMeScreen());
                  },
                  text: 'Перезвоните мне')),
          Spacer(),
          Container(
              child: Column(children: [
            Text('Написать нам в социальных сетях', style: additional14),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 36),
              child: Wrap(
                spacing: 30,
                children: <Widget>[
                  ImageButton(
                    type: SocialType.whatsapp,
                    onTap: () {},
                  ),
                  ImageButton(
                    type: SocialType.vk,
                    onTap: () {},
                  ),
                  ImageButton(
                    type: SocialType.instagram,
                    onTap: () {},
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    ));
  }
}

enum SocialType { whatsapp, instagram, vk }

class ImageButton extends StatelessWidget {
  final SocialType type;
  final Function onTap;
  const ImageButton({Key key, this.type, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image;
    switch (type) {
      case SocialType.whatsapp:
        image = Image.asset('assets/images/whatsapp-icon.png');
        break;
      case SocialType.vk:
        image = Image.asset('assets/images/vkcom.png');
        break;
      case SocialType.instagram:
        image = Image.asset('assets/images/instagram.png');
        break;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 36, height: 36, child: image),
    );
  }
}

// class _ManagerImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SvgPicture.asset('assets/images/img_manager.svg'),
//     );
//   }
// }

/*
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(textTitle: 'Чат с менеджером'),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<Support>(
            stream: supportInteractor.getContacts(),
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ответим на ваши вопросы',
                      style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(height: 32),
                  _ManagerImage(),
                  SizedBox(height: 32),
                  SupportButton(
                    text: 'Написать в WhatsApp',
                    iconData: AppIcons.whatsapp,
                    startColor: AppColor.whatsappGradientButtonStart,
                    endColor: AppColor.whatsappGradientButtonEnd,
                    onPressed: () {
                      launch('whatsapp://send?phone=${snapshot.data.whatsapp}');
                    },
                  ),
                  SizedBox(height: 14),
                  SupportButton(
                    text: 'Написать в Telegram',
                    iconData: AppIcons.telegram,
                    startColor: AppColor.telegramGradientButtonStart,
                    endColor: AppColor.telegramGradientButtonEnd,
                    onPressed: () {
                      launch('tg://resolve?domain=${snapshot.data.telegram}');
                    },
                  ),
                  SizedBox(height: 14),
                  SupportButton(
                    text: 'Связаться по телефону',
                    iconData: AppIcons.phone,
                    startColor: AppColor.gradientButtonStart,
                    endColor: AppColor.gradientButtonEnd,
                    onPressed: () {
                      launch('tel:${snapshot.data.phone}');
                    },
                  )
                ],
              );
          }
        ),
      ),
    );
  }
  */
