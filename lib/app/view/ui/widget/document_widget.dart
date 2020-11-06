import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:flutter/material.dart';

class DocumentWidget extends StatelessWidget {
  final String name;
  final String sizeDoc;
  final String typeDoc;
  const DocumentWidget({Key key, this.name, this.sizeDoc, this.typeDoc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: UiColors.border),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: basic16),
              SizedBox(height: 8),
              Text('$sizeDoc, $typeDoc', style: additional14)
            ]),
          ),
          Icon(UiIcons.download, size: 24, color: UiColors.main1)
        ],
      ),
    );
  }
}
