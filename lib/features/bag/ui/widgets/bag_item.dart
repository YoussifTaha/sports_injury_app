import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';

class BagItem extends StatelessWidget {
  final String $imageUrl;
  final String $title;
  const BagItem({super.key, required this.$imageUrl, required this.$title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          child: CachedNetworkImage(imageUrl: $imageUrl),
        ),
        verticalSpace(10),
        Text($title),
      ],
    );
  }
}
