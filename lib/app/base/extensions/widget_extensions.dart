import 'package:flutter/material.dart';

extension WidgetExt on Widget {

  Widget sliver() => SliverToBoxAdapter(child: this);
}