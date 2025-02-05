import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String url;

  const Profile({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.purple,
      backgroundImage: NetworkImage(url),
    );
  }
}
