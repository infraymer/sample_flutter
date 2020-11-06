import 'package:flutter/widgets.dart';

int _mainId = 0;

class GalleryNetworkItem {
  GalleryNetworkItem(String path) {
    this.path = path;
    _mainId++;
  }

  int id = _mainId;
  String path;
//final bool isSvg;
}

// Preview. Possible not to use :)
class GalleryNetworkItemThumbnail extends StatelessWidget {
  const GalleryNetworkItemThumbnail(
      {Key key, this.galleryNetworkItem, this.onTap})
      : super(key: key);

  final GalleryNetworkItem galleryNetworkItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryNetworkItem.id,
          child: Image.network(galleryNetworkItem.path, height: 80.0),
        ),
      ),
    );
  }
}

////
// It's possible to create other class to asset Images below
// Just copy whole structure above and change names
