import 'package:flutter/material.dart';

import 'required_doc_widget.dart';

class ListOfRequiredDocuments extends StatelessWidget {
  final List<RequiredDocData> data;
  const ListOfRequiredDocuments({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return RequiredDocWidget(
              title: item.title,
              subtitle: item.subtitle,
              image: item.image,
              imageWidget: item.imageWidget,
              onTap: item.onTap);
        });
  }
}
