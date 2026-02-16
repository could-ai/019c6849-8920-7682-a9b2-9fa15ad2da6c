import 'package:flutter/material.dart';
import '../mock_data.dart';
import '../widgets/tiktok_video_item.dart';
import '../widgets/instagram_post_item.dart';
import '../widgets/youtube_video_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // TikTok Feed
  Widget _buildTikTokFeed() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: MockData.shorts.length,
      itemBuilder: (context, index) {
        return TikTokVideoItem(data: MockData.shorts[index]);
      },
    );
  }

  // Instagram Feed
  Widget _buildInstagramFeed() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Feed', style: TextStyle(fontFamily: 'Cursive', fontSize: 24)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: MockData.posts.length,
        itemBuilder: (context, index) {
          return InstagramPostItem(data: MockData.posts[index]);
        },
      ),
    );
  }

  // YouTube Feed
  Widget _buildYouTubeFeed() {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.play_circle_filled, color: Colors.red),
            SizedBox(width: 8),
            Text('VideoHub', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.builder(
        itemCount: MockData.videos.length,
        itemBuilder: (context, index) {
          return YouTubeVideoCard(data: MockData.videos[index]);
        },
      ),
    );
  }

  // Profile
  Widget _buildProfile() {
    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200&h=200&fit=crop'),
            ),
            const SizedBox(height: 10),
            const Text('مستخدم جديد', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('@new_user', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat('Following', '120'),
                _buildStat('Followers', '5.4k'),
                _buildStat('Likes', '10k'),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Image.network(
                  'https://picsum.photos/200?random=$index',
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildTikTokFeed(),
      _buildYouTubeFeed(),
      const Center(child: Text('Add Content', style: TextStyle(fontSize: 24))),
      _buildInstagramFeed(),
      _buildProfile(),
    ];

    // Determine background color based on selected tab (TikTok needs black)
    final bool isDark = _selectedIndex == 0;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SafeArea(
        top: !isDark, // Don't add safe area top for TikTok full screen
        bottom: false,
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDark ? Colors.black : Colors.white,
        selectedItemColor: isDark ? Colors.white : Colors.black,
        unselectedItemColor: isDark ? Colors.grey : Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shorts'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Videos'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
