import 'package:bibimoney/app/view/ui/res/text_styles.dart';
import 'package:flutter/material.dart';

class ImageWithCount extends StatelessWidget {
  final Widget image;
  final int count;

  const ImageWithCount({Key key, this.count, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(children: [
        // image,
        Positioned(
          top: 17,
          left: 15,
          child: Text('+$count', style: basic14))
      ]),
    );
  }
}
