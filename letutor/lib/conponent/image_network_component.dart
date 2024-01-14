// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:letutor/conponent/assets.gen.dart';

class ImageNetworkComponent extends StatelessWidget {
  final String url;

  const ImageNetworkComponent({
    super.key,
    required this.url,
  });

  Future<bool> checkImageUrl(String url) async {
    if (url == null || url.isEmpty) {
      return false;
    }
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkImageUrl(url),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data == true) {
          return CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Assets.images.notFoundImages.image(),
          );
        } else {
          return Assets.images.notFoundImages.image();
        }
      },
    );
  }
}
