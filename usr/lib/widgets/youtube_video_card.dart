import 'package:flutter/material.dart';

class YouTubeVideoCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const YouTubeVideoCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Thumbnail
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.network(
              data['thumbnail'],
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 220,
                color: Colors.grey[800],
                child: const Icon(Icons.video_library, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                '10:25',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),

        // Info
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(data['avatar']),
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${data['channel']} • ${data['views']} • ${data['time']}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
