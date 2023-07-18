import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lotteryapp/core/controller/api/api_requst.dart';

class CachedImageScreen extends StatelessWidget {
  const CachedImageScreen({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: CachedNetworkImage(
          imageUrl: baseUrl +
              '/public/uploads/' +
              path, // Replace with your image URL
          placeholder: (context, url) =>
              CircularProgressIndicator(), // Optional: Placeholder widget while loading
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.fitWidth,
          fadeInCurve: Curves.bounceIn,
        ),
      ),
    );
  }
}
