import 'package:flutter/material.dart';

void main() {
  runApp(const WorldMediaApp());
}

class WorldMediaApp extends StatelessWidget {
  const WorldMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Media',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Colors.redAccent,
          secondary: Colors.white,
          surface: Color(0xFF121212),
          background: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(),
      },
    );
  }
}

// --- MOCK DATA ---
class Video {
  final String id;
  final String title;
  final String channelName;
  final String views;
  final String duration;
  final String timeAgo;
  final String thumbnailUrl;

  Video({
    required this.id,
    required this.title,
    required this.channelName,
    required this.views,
    required this.duration,
    required this.timeAgo,
    required this.thumbnailUrl,
  });
}

final List<Video> mockVideos = [
  Video(
    id: '1',
    title: 'Flutter Tutorial for Beginners - Full Course',
    channelName: 'Flutter Devs',
    views: '1.2M views',
    duration: '3:45:20',
    timeAgo: '2 days ago',
    thumbnailUrl: 'https://picsum.photos/seed/flutter/600/300',
  ),
  Video(
    id: '2',
    title: 'Top 10 Tech Trends in 2024',
    channelName: 'Tech World',
    views: '500K views',
    duration: '12:30',
    timeAgo: '1 week ago',
    thumbnailUrl: 'https://picsum.photos/seed/tech/600/300',
  ),
  Video(
    id: '3',
    title: 'Beautiful Nature Cinematic Video 4K',
    channelName: 'Nature Lens',
    views: '2.5M views',
    duration: '5:15',
    timeAgo: '1 month ago',
    thumbnailUrl: 'https://picsum.photos/seed/nature/600/300',
  ),
  Video(
    id: '4',
    title: 'How to Build a YouTube Clone',
    channelName: 'Code Master',
    views: '89K views',
    duration: '45:00',
    timeAgo: '3 hours ago',
    thumbnailUrl: 'https://picsum.photos/seed/code/600/300',
  ),
];

// --- MAIN LAYOUT (RESPONSIVE) ---
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const ShortsView(),
    const UploadView(),
    const SubscriptionsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              backgroundColor: Colors.black,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              selectedLabelTextStyle: const TextStyle(color: Colors.white),
              unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.play_arrow_outlined),
                  selectedIcon: Icon(Icons.play_arrow),
                  label: Text('Shorts'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_circle_outline),
                  selectedIcon: Icon(Icons.add_circle),
                  label: Text('Upload'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.subscriptions_outlined),
                  selectedIcon: Icon(Icons.subscriptions),
                  label: Text('Subscriptions'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
              ],
            ),
          if (isDesktop) const VerticalDivider(thickness: 1, width: 1, color: Colors.white24),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.play_arrow_outlined), activeIcon: Icon(Icons.play_arrow), label: 'Shorts'),
                BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline, size: 40), activeIcon: Icon(Icons.add_circle, size: 40), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined), activeIcon: Icon(Icons.subscriptions), label: 'Subscriptions'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
    );
  }
}

// --- HOME VIEW ---
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.play_circle_filled, color: Colors.redAccent, size: 32),
            SizedBox(width: 8),
            Text('World Media', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: -1)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blueAccent,
            child: Text('U', style: TextStyle(fontSize: 14, color: Colors.white)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        itemCount: mockVideos.length,
        itemBuilder: (context, index) {
          final video = mockVideos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoPlayerScreen(video: video)),
              );
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      color: Colors.grey[900],
                      child: Image.network(video.thumbnailUrl, fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        color: Colors.black87,
                        child: Text(video.duration, style: const TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.primaries[index % Colors.primaries.length],
                        child: Text(video.channelName[0]),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              video.title,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${video.channelName} • ${video.views} • ${video.timeAgo}',
                              style: const TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- SHORTS VIEW ---
class ShortsView extends StatelessWidget {
  const ShortsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.3),
                child: const Center(
                  child: Icon(Icons.play_arrow, size: 80, color: Colors.white54),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 16, backgroundColor: Colors.white),
                        const SizedBox(width: 8),
                        Text('@creator_$index', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size(60, 30),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                          child: const Text('Subscribe', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Amazing short video content! #shorts #viral', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 8,
                child: Column(
                  children: [
                    _buildShortAction(Icons.thumb_up, '12K'),
                    _buildShortAction(Icons.thumb_down, 'Dislike'),
                    _buildShortAction(Icons.comment, '456'),
                    _buildShortAction(Icons.share, 'Share'),
                    _buildShortAction(Icons.more_horiz, ''),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildShortAction(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Icon(icon, size: 32),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ]
        ],
      ),
    );
  }
}

// --- UPLOAD VIEW ---
class UploadView extends StatelessWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_upload_outlined, size: 100, color: Colors.grey),
            const SizedBox(height: 24),
            const Text('Upload a video to World Media', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Upload feature will be available when backend is connected.')),
                );
              },
              icon: const Icon(Icons.upload),
              label: const Text('Select File'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SUBSCRIPTIONS VIEW ---
class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.primaries[index % Colors.primaries.length],
                        child: Text('C$index'),
                      ),
                      const SizedBox(height: 4),
                      Text('Channel $index', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(color: Colors.white24),
          Expanded(
            child: Center(
              child: Text('Recent videos from your subscriptions will appear here.', style: TextStyle(color: Colors.grey[400])),
            ),
          ),
        ],
      ),
    );
  }
}

// --- PROFILE VIEW ---
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueAccent,
                child: Text('U', style: TextStyle(fontSize: 32, color: Colors.white)),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('@username • 120 subscribers', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Text('Manage your World Media account', style: TextStyle(color: Colors.blue, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.playlist_play),
            title: const Text('Playlists'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.watch_later_outlined),
            title: const Text('Watch Later'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.thumb_up_outlined),
            title: const Text('Liked Videos'),
            onTap: () {},
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Sign In / Register'),
            subtitle: const Text('Connect database to enable authentication'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Authentication requires Supabase/Firebase connection.')),
              );
            },
          ),
        ],
      ),
    );
  }
}

// --- VIDEO PLAYER SCREEN ---
class VideoPlayerScreen extends StatelessWidget {
  final Video video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Mock Video Player Area
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.black,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(video.thumbnailUrl, fit: BoxFit.cover),
                  Container(color: Colors.black45),
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 32),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            
            // Video Details
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(video.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('${video.views} • ${video.timeAgo}', style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16),
                  
                  // Actions
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildActionButton(Icons.thumb_up_outlined, '10K'),
                        _buildActionButton(Icons.thumb_down_outlined, 'Dislike'),
                        _buildActionButton(Icons.share_outlined, 'Share'),
                        _buildActionButton(Icons.download_outlined, 'Download'),
                        _buildActionButton(Icons.library_add_outlined, 'Save'),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  const Divider(color: Colors.white24),
                  
                  // Channel Info
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(video.channelName[0]),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(video.channelName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const Text('1.5M subscribers', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Subscribe'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  const Divider(color: Colors.white24),
                  
                  // Comments Section Mock
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Comments 1.2K', style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.unfold_more),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const CircleAvatar(radius: 12, backgroundColor: Colors.grey),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('This is an amazing video! Thanks for sharing.', style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 24),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
