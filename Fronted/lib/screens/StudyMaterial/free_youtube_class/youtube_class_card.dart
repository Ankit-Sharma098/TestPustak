import 'package:flutter/material.dart';
import 'youtube_class_model.dart';

class YoutubeClassCard extends StatelessWidget {
  final YoutubeClass youtubeClass;
  final VoidCallback onTap;

  const YoutubeClassCard({
    super.key,
    required this.youtubeClass,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🎥 THUMBNAIL (LEFT)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  youtubeClass.thumbnail,
                  width: 100,
                  height: 65,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 65,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.play_circle_fill),
                    );
                  },
                ),
              ),

              const SizedBox(width: 12),

              // 📄 CONTENT (RIGHT)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      youtubeClass.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Subject + Duration
                    Row(
                      children: [
                        Text(
                          youtubeClass.subject,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          youtubeClass.duration,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Teacher
                    Text(
                      youtubeClass.teacher,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}