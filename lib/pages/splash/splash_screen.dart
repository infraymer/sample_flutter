import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/pages/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.accent,
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            bottom: MediaQuery.of(context).size.height / 15,
            right: -80,
            child: Image.asset('assets/images/main_screen_car.png'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 27.0, 16.0, 34.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/menu-logo.png'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Деньги под ПТС \nза 15 минут',
                      textAlign: TextAlign.center,
                      style: basic12.copyWith(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _StringWidget(text: 'Машина остается у вас'),
                          _StringWidget(text: 'Одобряем 99% заявок'),
                          _StringWidget(
                              text: 'Без комиссий и дополнительных пакетов'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Get.to(AuthScreen());
                      },
                      child: Text('Войти / Зарегестрироваться',
                          style: basic14.copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _StringWidget extends StatelessWidget {
  final String text;

  const _StringWidget({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(UiIcons.check_circle),
        SizedBox(width: 13),
        Expanded(child: Text(text, style: basic16)),
      ],
    );
  }
}
