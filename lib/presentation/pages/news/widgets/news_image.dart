import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_news/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  final String? imageUrl;

  const NewsImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageUrl != null && imageUrl!.isNotEmpty)
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            placeholder: (context, url) => _getPlaceHolder(),
            errorWidget: (context, url, error) => _getErrorHolder(),
            fit: BoxFit.cover,
          )
        : _getPlaceHolder();
  }

  Widget _getPlaceHolder() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50.0),
      child: Icon(
        Icons.image_outlined,
        color: AppColors.offWhite,
        size: 40.0,
      ),
    );
  }

  Widget _getErrorHolder() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50.0),
      child: Icon(
        Icons.error,
        color: AppColors.offWhite,
        size: 40.0,
      ),
    );
  }
}
