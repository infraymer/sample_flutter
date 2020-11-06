import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiStyles {
  static title(BuildContext context) => Theme.of(context)
      .textTheme
      .subtitle1
      .copyWith(fontWeight: FontWeight.bold);
}

const heading1 = const TextStyle(
    color: UiColors.main1,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -1);

const heading2 = const TextStyle(
  color: UiColors.main1,
  fontSize: 18,
);

const heading1Grey = const TextStyle(
    color: UiColors.additional,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -1);

const basic12 = const TextStyle(
  color: UiColors.main1,
  fontSize: 12,
);

const additional12 = const TextStyle(
  color: UiColors.additional,
  fontSize: 12,
);

const additional12bold = const TextStyle(
  color: UiColors.additional,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

const basic14 = const TextStyle(
  color: UiColors.main1,
  fontSize: 14,
);

const basic14bold = const TextStyle(
  color: UiColors.main1,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

const basic14SemiBold = const TextStyle(
  color: UiColors.main1,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const additional14 = const TextStyle(
  color: UiColors.additional,
  fontSize: 14,
);

const basic16 = const TextStyle(
  color: UiColors.main1,
  fontSize: 16,
);

const basic16bold = const TextStyle(
  color: UiColors.main1,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
