import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCached extends StatefulWidget {
  final double width;
  final double height;
  final String url;
  const ImageCached({super.key, required this.width, required this.height, required this.url});

  @override
  State<ImageCached> createState() => _ImageCachedState();
}

class _ImageCachedState extends State<ImageCached> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: widget.width,
      height: widget.height,
      imageUrl: widget.url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(color: Colors.transparent,),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
