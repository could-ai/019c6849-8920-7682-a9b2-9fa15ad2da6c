import 'package:flutter/material.dart';

class MockData {
  static final List<String> profileImages = [
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&h=200&fit=crop',
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200&h=200&fit=crop',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=200&h=200&fit=crop',
  ];

  static final List<String> contentImages = [
    'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=600&h=1000&fit=crop',
    'https://images.unsplash.com/photo-1526779218898-4f60b481608c?w=600&h=1000&fit=crop',
    'https://images.unsplash.com/photo-1492691527719-9d1e07e534b4?w=600&h=1000&fit=crop',
    'https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?w=600&h=1000&fit=crop',
    'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=600&h=1000&fit=crop',
  ];

  static final List<Map<String, dynamic>> posts = [
    {
      'username': 'ahmed_ali',
      'avatar': profileImages[0],
      'image': contentImages[0],
      'likes': '1.2k',
      'comments': '45',
      'caption': 'يوم جميل في الطبيعة 🌲 #nature #travel',
      'type': 'instagram'
    },
    {
      'username': 'sara_design',
      'avatar': profileImages[3],
      'image': contentImages[1],
      'likes': '850',
      'comments': '23',
      'caption': 'تصميمي الجديد للموقع 💻 #uiux #design',
      'type': 'instagram'
    },
  ];

  static final List<Map<String, dynamic>> shorts = [
    {
      'username': 'funny_clips',
      'avatar': profileImages[1],
      'image': contentImages[2],
      'likes': '50k',
      'comments': '1020',
      'caption': 'لن تصدق ما حدث! 😱 #funny #viral',
    },
    {
      'username': 'travel_vlog',
      'avatar': profileImages[2],
      'image': contentImages[3],
      'likes': '25k',
      'comments': '500',
      'caption': 'أفضل مكان للزيارة في الصيف ☀️ #summer',
    },
    {
      'username': 'tech_news',
      'avatar': profileImages[4],
      'image': contentImages[4],
      'likes': '10k',
      'comments': '300',
      'caption': 'مراجعة الهاتف الجديد 📱 #tech',
    },
  ];

  static final List<Map<String, dynamic>> videos = [
    {
      'title': 'دورة فلاتر كاملة للمبتدئين 2024',
      'channel': 'Code Master',
      'views': '150k views',
      'time': '2 days ago',
      'thumbnail': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600&h=350&fit=crop',
      'avatar': profileImages[0],
    },
    {
      'title': 'أفضل 10 أماكن سياحية في العالم',
      'channel': 'Travel Guide',
      'views': '1.2M views',
      'time': '1 week ago',
      'thumbnail': 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=600&h=350&fit=crop',
      'avatar': profileImages[1],
    },
    {
      'title': 'كيف تطبخ الباستا الإيطالية',
      'channel': 'Chef Mario',
      'views': '500k views',
      'time': '3 days ago',
      'thumbnail': 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=600&h=350&fit=crop',
      'avatar': profileImages[3],
    },
  ];
}
