import 'package:flutter/material.dart';

class AppDecorations {
  static final cardBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    border: Border.all(color: Colors.black12),
  );

  static const roundedBottomSheet = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
  );
}
