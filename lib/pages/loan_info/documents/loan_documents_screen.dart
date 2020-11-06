import 'package:bibimoney/app/view/ui/widget/document_widget.dart';
import 'package:flutter/material.dart';

class LoanDocementsScreen extends StatelessWidget {
  const LoanDocementsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: ListView(
          children: List.generate(
              4,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: DocumentWidget(
                      name: 'Соглашение об электронном взаимодействии',
                      sizeDoc: '140кб',
                      typeDoc: 'doc',
                    ),
                  )),
        ),
      ),
    );
  }
}
