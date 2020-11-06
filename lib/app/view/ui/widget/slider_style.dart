import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

FlutterSliderHandler sliderHandler(BuildContext context) => FlutterSliderHandler(
  child: Material(
    type: MaterialType.canvas,
    color: Theme.of(context).accentColor,
    borderRadius: BorderRadius.circular(60),
    elevation: 0,
    child: Container(
      padding: EdgeInsets.all(2),
      child: ClipOval(
        child: Container(
          color: Colors.white,
        ),
      ),
    ),
  ),
);

FlutterSliderTrackBar sliderTrackBar(BuildContext context) => FlutterSliderTrackBar(
  activeTrackBar: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Theme.of(context).accentColor),
);