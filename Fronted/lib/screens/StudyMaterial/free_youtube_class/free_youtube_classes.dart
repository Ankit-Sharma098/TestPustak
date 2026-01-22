import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'youtube_dummy_data.dart';
import 'youtube_class_card.dart';
import 'youtube_class_model.dart';

class FreeYoutubeClassesScreen extends StatelessWidget {
  const FreeYoutubeClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free YouTube Classes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: ListView.builder(
        itemCount: youtubeClassesList.length,
        itemBuilder: (context, index) {
          final YoutubeClass youtubeClass = youtubeClassesList[index];

          return YoutubeClassCard(
            youtubeClass: youtubeClass,
            onTap: () {
              _openYoutubeVideo(youtubeClass.youtubeUrl);
            },
          );
        },
      ),
    );
  }

  // 🔗 Open YouTube app / browser
  Future<void> _openYoutubeVideo(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}