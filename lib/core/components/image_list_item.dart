import 'package:cached_network_image/cached_network_image.dart';
import 'package:evermos_pexels/domain/entity/images_entity.dart';
import 'package:flutter/material.dart';

class ImageListItem extends StatelessWidget {
  final ImagesEntity entity;
  final Function(int) onTap;

  const ImageListItem({required this.entity, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(entity.id);
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: entity.image,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'by ${entity.name}',
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
