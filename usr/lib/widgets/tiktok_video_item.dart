import 'package:flutter/material.dart';
import '../mock_data.dart';

class TikTokVideoItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const TikTokVideoItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image (Simulating Video)
        Image.network(
          data['image'],
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                color: Colors.white,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(color: Colors.black),
        ),
        
        // Gradient Overlay
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.0, 0.6, 1.0],
            ),
          ),
        ),

        // Play Icon (Center)
        const Center(
          child: Icon(Icons.play_arrow_rounded, size: 80, color: Colors.white24),
        ),

        // Right Side Actions
        Positioned(
          right: 10,
          bottom: 100,
          child: Column(
            children: [
              _buildProfileAvatar(data['avatar']),
              const SizedBox(height: 20),
              _buildAction(Icons.favorite, data['likes'], Colors.red),
              const SizedBox(height: 20),
              _buildAction(Icons.comment, data['comments'], Colors.white),
              const SizedBox(height: 20),
              _buildAction(Icons.share, 'Share', Colors.white),
              const SizedBox(height: 20),
              _buildAction(Icons.music_note, 'Sound', Colors.white),
            ],
          ),
        ),

        // Bottom Info
        Positioned(
          left: 10,
          bottom: 20,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@${data['username']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                data['caption'],
                style: const TextStyle(color: Colors.white, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.music_note, size: 15, color: Colors.white),
                  SizedBox(width: 5),
                  Text('Original Sound - Artist Name', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileAvatar(String url) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(url),
            backgroundColor: Colors.grey[800],
          ),
        ),
        const Positioned(
          bottom: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.pink,
            child: Icon(Icons.add, size: 15, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buildAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 35, color: color),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
