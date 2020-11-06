import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CatalogLoading extends StatelessWidget {
  final bool isLoading;

  const CatalogLoading({Key key, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SpinKitRipple(
              color: Theme.of(context).accentColor,
              size: 100,
            ),
          )
        : SizedBox();
  }
}
