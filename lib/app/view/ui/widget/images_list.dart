import 'package:bibimoney/app/view/ui/widget/photo_view_gallery_controller.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

GalleryController galleryController = GalleryController();
// Для отображения загрузки ниже
bool loaded = false;

class ImagesList extends StatelessWidget {
  final List<String> images;

  const ImagesList({Key key, this.images = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Фотография продукции'), // , style: basic16bold
        SizedBox(height: 8),
        SizedBox(
          height: 118,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: images
                .mapIndexed(
                  (i, e) => _Image(
                    path: e,
                    id: i,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

class _Image extends StatelessWidget {
  final String path;
  final int id;

  _Image({Key key, this.path, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: 162,
      height: 118,
      child: GestureDetector(
        onTap: () {
          galleryController.open(context, id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            path,
            fit: BoxFit.cover,
            errorBuilder: (context, obj, trace) {
              return Container(color: Colors.grey);
            },
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              } else {
                loaded = true;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
