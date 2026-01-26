import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'services/auth_service.dart';
import 'services/image_service.dart';
import 'reset_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://wuttauqzqfkedndqgqms.supabase.co',
    anonKey: 'sb_publishable_CVazjgij0xU560SvIehiog_Hm01hH0l',
  );
  
  runApp(const LovatraApp());
}

class LovatraApp extends StatelessWidget {
  const LovatraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lovatra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF4D8D),
          secondary: const Color(0xFF00D4AA),
          surface: const Color(0xFF1A1A1A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeroSection(context),
              const SizedBox(height: 40),
              _buildProfileCardsSection(),
              const SizedBox(height: 40),
              _buildMicroTestSection(context),
              const SizedBox(height: 40),
              _buildGlobalSection(),
              const SizedBox(height: 40),
              _buildFinalCTASection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1,248,092 SOULS CONNECTING',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, height: 1.1),
                children: [
                  TextSpan(text: 'Dating,\n'),
                  TextSpan(
                    text: 'Elevated\n',
                    style: TextStyle(color: Color(0xFFFF4D8D)),
                  ),
                  TextSpan(text: 'by AI.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Skip the small talk. Lovatra uses personality vectors to find the one who truly resonates with your core.',
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCardsSection() {
    return SizedBox(
      height: 380,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: const [
          ProfileCard(
            name: 'Bianca, 26',
            tag: 'AI Verified',
            bio: '"Just a girl who loves sunsets, art, and spontaneous adventures. Looking for someone to share good food and even better conversations with."',
            compatibility: 'High',
          ),
          SizedBox(width: 20),
          ProfileCard(
            name: 'Marcus, 29',
            tag: 'Neural Match',
            bio: '"Tech entrepreneur who finds solace in philosophy books and mountain biking. Searching for depth beyond the digital surface."',
            compatibility: 'Very High',
          ),
          SizedBox(width: 20),
          ProfileCard(
            name: 'Sophie, 25',
            tag: 'Global Pulse',
            bio: '"Artist from Paris exploring connections between cultures. Believes love speaks all languages."',
            compatibility: 'Medium',
          ),
        ],
      ),
    );
  }

  Widget _buildMicroTestSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Decode your vibe.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.grey[100],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Take our signature micro-test and see how our engine profiles you in seconds.',
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Text(
                    '"What defines your perfect evening?"',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey[200]),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PersonalityTestScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFF4D8D)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start Test',
                          style: TextStyle(color: Color(0xFFFF4D8D), fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 18, color: Color(0xFFFF4D8D)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.2),
                children: [
                  TextSpan(text: 'Love has\n'),
                  TextSpan(
                    text: 'no borders.',
                    style: TextStyle(color: Color(0xFF00D4AA)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Discover soulmates who truly resonate with your personality, no matter where they are.',
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildFeatureChip('Real-time Matching', Icons.bar_chart),
              _buildFeatureChip('AI Compatibility', Icons.psychology),
              _buildFeatureChip('Global Network', Icons.public),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinalCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Stop swiping.\nStart knowing.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.grey[100],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Trade superficial scrolls for neural compatibility. Join the elite community of souls searching for depth.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            ),
          ),
          const SizedBox(height: 32),
          const Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ValuePill(icon: Icons.search, label: 'Soul Search'),
              ValuePill(icon: Icons.psychology, label: 'AI Analysis'),
              ValuePill(icon: Icons.lock, label: 'Privacy First'),
              ValuePill(icon: Icons.verified, label: 'Verified Profiles'),
            ],
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 60),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4D8D), Color(0xFFFF6B35)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                'Join Lovatra',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),         
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF00D4AA)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String tag;
  final String bio;
  final String compatibility;

  const ProfileCard({
    super.key,
    required this.name,
    required this.tag,
    required this.bio,
    required this.compatibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF00D4AA).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF00D4AA)),
            ),
            child: Text(
              tag,
              style: const TextStyle(fontSize: 11, color: Color(0xFF00D4AA), fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: Text(
              bio,
              style: TextStyle(fontSize: 15, color: Colors.grey[300], fontStyle: FontStyle.italic),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          const Divider(color: Color(0xFF333333), height: 24),
          Row(
            children: [
              const Icon(Icons.favorite, color: Color(0xFFFF4D8D), size: 18),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  'Neural Pulse',
                  style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Text(
                'Match:',
                style: TextStyle(fontSize: 13, color: Colors.grey[400]),
              ),
              const SizedBox(width: 4),
              Container(
                constraints: const BoxConstraints(minWidth: 60),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D4AA).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF00D4AA)),
                ),
                child: Text(
                  compatibility,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00D4AA),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ValuePill extends StatelessWidget {
  final IconData icon;
  final String label;

  const ValuePill({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFFFF4D8D)),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;
  final int _remainingSwipes = 30;
  bool _likesChecked = true;
  bool _settingsChecked = true;
  
  Map<String, dynamic>? _userProfile;
  final AuthService _authService = AuthService();
  final ImageService _imageService = ImageService();
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final profile = await _authService.getCurrentUserProfile();
      if (mounted) {
        setState(() {
          _userProfile = profile;
          _profileImageUrl = profile?['profile_image_url'];
        });
      }
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }

  Future<void> _updateProfileImage(String imageUrl) async {
    try {
      await _authService.updateProfile(profileImageUrl: imageUrl);
      setState(() {
        _profileImageUrl = imageUrl;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile photo updated!'),
          backgroundColor: Color(0xFF00D4AA),
        ),
      );
    } catch (e) {
      print('Error updating profile image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: const Color(0xFFFF4D8D),
        ),
      );
    }
  }

  Future<void> _showImagePicker() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: const Color(0xFF1A1A1A),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: const Text('Choose from Gallery', style: TextStyle(color: Colors.white)),
              onTap: () async {
                Navigator.pop(context);
                final imageUrl = await _imageService.pickAndUploadImage();
                if (imageUrl != null) {
                  await _updateProfileImage(imageUrl);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text('Take Photo', style: TextStyle(color: Colors.white)),
              onTap: () async {
                Navigator.pop(context);
                final imageUrl = await _imageService.takeAndUploadPhoto();
                if (imageUrl != null) {
                  await _updateProfileImage(imageUrl);
                }
              },
            ),
            if (_profileImageUrl != null && _profileImageUrl!.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Remove Photo', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  await _updateProfileImage('');
                },
              ),
          ],
        ),
      ),
    );
  }

  String _getUserName() {
    if (_userProfile != null) {
      final firstName = _userProfile?['first_name']?.toString() ?? '';
      final lastName = _userProfile?['last_name']?.toString() ?? '';
      return '$firstName $lastName'.trim();
    }
    return 'Joseph Sawasawa';
  }

  String _getDisplayName() {
    if (_userProfile != null) {
      final firstName = _userProfile?['first_name']?.toString() ?? 'User';
      final age = _userProfile?['age']?.toString() ?? '24';
      return '$firstName, $age';
    }
    return 'Tim, 24';
  }

  String _getUserBio() {
    if (_userProfile != null) {
      final bio = _userProfile?['bio']?.toString();
      if (bio != null && bio.isNotEmpty) {
        return bio;
      }
    }
    return 'An adventurous and kind-hearted person who values deep connections and exploring new things.';
  }

  String _getUserEmail() {
    if (_userProfile != null) {
      return _userProfile?['email']?.toString() ?? '';
    }
    return 'user@example.com';
  }

  void _logout(BuildContext context) {
    _authService.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lovatra Dating'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildDrawer() {
    final userName = _getUserName();
    final displayName = _getDisplayName();
    final userBio = _getUserBio();

    return Drawer(
      backgroundColor: const Color(0xFF1A1A1A),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _showImagePicker,
                  child: Stack(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF333333),
                          image: _profileImageUrl != null && _profileImageUrl!.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(_profileImageUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _profileImageUrl == null || _profileImageUrl!.isEmpty
                            ? const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF4D8D),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  userBio,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Drop your Phone screen to the kin.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00D4AA),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF333333)),
          _buildDrawerItem('Discover', 0, Icons.explore),
          _buildDrawerItemWithCheckbox('Likes', 1, Icons.favorite_border, _likesChecked, (value) {
            setState(() => _likesChecked = value ?? false);
          }),
          _buildDrawerItem('Feed', 2, Icons.dynamic_feed),
          _buildDrawerItem('Explore', 3, Icons.public),
          _buildDrawerItem('Suggestions', 4, Icons.people),
          _buildDrawerItem('Chat', 5, Icons.chat_bubble_outline),
          _buildDrawerItem('Activity', 6, Icons.notifications),
          _buildDrawerItemWithCheckbox('Settings', 7, Icons.settings, _settingsChecked, (value) {
            setState(() => _settingsChecked = value ?? false);
          }),
          const Divider(color: Color(0xFF333333)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.swipe, size: 16, color: Color(0xFF00D4AA)),
                    const SizedBox(width: 8),
                    Text(
                      '$_remainingSwipes SWIPES REMAINING',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00D4AA),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _logout(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D8D),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, int index, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: _selectedIndex == index ? const Color(0xFFFF4D8D) : Colors.grey),
      title: Text(title,
          style: TextStyle(
            color: _selectedIndex == index ? const Color(0xFFFF4D8D) : Colors.white,
            fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          )),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget _buildDrawerItemWithCheckbox(String title, int index, IconData icon, bool value, ValueChanged<bool?> onChanged) {
    return ListTile(
      leading: Icon(icon, color: _selectedIndex == index ? const Color(0xFFFF4D8D) : Colors.grey),
      title: Text(title,
          style: TextStyle(
            color: _selectedIndex == index ? const Color(0xFFFF4D8D) : Colors.white,
            fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          )),
      trailing: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFFF4D8D),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return DiscoverScreen(
          userName: _getDisplayName(),
          userBio: _getUserBio(),
          profileImageUrl: _profileImageUrl,
          onImageUpdate: _updateProfileImage,
        );
      case 1:
        return const LikesScreen();
      case 2:
        return const FeedScreen();
      case 3:
        return const ExploreScreen();
      case 4:
        return const SuggestionsScreen();
      case 5:
        return ChatScreen(userName: _getUserName());
      case 6:
        return const ActivityScreen();
      case 7:
        return SettingsScreen(
          userName: _getUserName(),
          userEmail: _getUserEmail(),
          userProfile: _userProfile,
          profileImageUrl: _profileImageUrl,
          onProfileUpdate: _loadUserProfile,
          onImageUpdate: _updateProfileImage,
        );
      default:
        return DiscoverScreen(
          userName: _getDisplayName(),
          userBio: _getUserBio(),
          profileImageUrl: _profileImageUrl,
          onImageUpdate: _updateProfileImage,
        );
    }
  }
}

class DiscoverScreen extends StatelessWidget {
  final String userName;
  final String userBio;
  final String? profileImageUrl;
  final Function(String)? onImageUpdate;

  const DiscoverScreen({
    super.key,
    required this.userName,
    required this.userBio,
    this.profileImageUrl,
    this.onImageUpdate,
  });

  void _showImagePicker(BuildContext context) async {
    final imageService = ImageService();
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: const Color(0xFF1A1A1A),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: const Text('Choose from Gallery', style: TextStyle(color: Colors.white)),
              onTap: () async {
                Navigator.pop(context);
                final imageUrl = await imageService.pickAndUploadImage();
                if (imageUrl != null && onImageUpdate != null) {
                  onImageUpdate!(imageUrl);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text('Take Photo', style: TextStyle(color: Colors.white)),
              onTap: () async {
                Navigator.pop(context);
                final imageUrl = await imageService.takeAndUploadPhoto();
                if (imageUrl != null && onImageUpdate != null) {
                  onImageUpdate!(imageUrl);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildNavItem('Likes', 0),
                _buildNavItem('Feed', 1),
                _buildNavItem('Explore', 2),
                _buildNavItem('Suggestions', 3),
                _buildNavItem('Chat', 4),
                _buildNavItem('Activity', 5),
                _buildNavItem('Settings', 6),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFF333333)),
          const SizedBox(height: 20),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showImagePicker(context);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF333333),
                                image: profileImageUrl != null && profileImageUrl!.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(profileImageUrl!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: profileImageUrl == null || profileImageUrl!.isEmpty
                                  ? const Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF4D8D),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              userBio,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Drop your Phone screen to the kin.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00D4AA),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4D8D).withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: const Color(0xFFFF4D8D)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.swipe, color: Color(0xFFFF4D8D), size: 20),
                const SizedBox(width: 8),
                const Text(
                  '30 SWIPES REMAINING',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF4D8D),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFF333333),
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 30),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                ),
                
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFF00D4AA).withOpacity(0.1),
                  child: IconButton(
                    icon: const Icon(Icons.star, size: 30),
                    color: const Color(0xFF00D4AA),
                    onPressed: () {},
                  ),
                ),
                
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFFFF4D8D).withOpacity(0.2),
                  child: IconButton(
                    icon: const Icon(Icons.favorite, size: 30),
                    color: const Color(0xFFFF4D8D),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: index == 1 || index == 6 ? FontWeight.bold : FontWeight.normal,
          color: index == 1 || index == 6 ? const Color(0xFFFF4D8D) : Colors.grey,
        ),
      ),
    );
  }
}

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFFFF4D8D).withOpacity(0.1), const Color(0xFF00D4AA).withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'See Who Likes You',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Premium members can see everyone who\'s already swiped right on them.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4D8D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'UPGRADE TO PREMIUM',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final supabase = Supabase.instance.client;
  final picker = ImagePicker();
  
  List<FeedPost> feedPosts = [];
  bool isLoading = true;
  bool isUploading = false;
  TextEditingController _captionController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _loadFeedPosts();
    _checkUserLikes();
  }
  
  Future<void> _loadFeedPosts() async {
    try {
      setState(() => isLoading = true);
      
      // Get all feed posts with user profiles
      final response = await supabase
          .from('feed_posts')
          .select('''
            *,
            profiles:user_id (
              id,
              first_name,
              last_name,
              profile_image_url
            )
          ''')
          .order('created_at', ascending: false);
      
      // Get all likes to count them properly
      final likesResponse = await supabase
          .from('post_likes')
          .select('post_id')
          .order('created_at');
      
      // Count likes per post
      final Map<String, int> likeCounts = {};
      for (var like in likesResponse) {
        final postId = like['post_id'].toString();
        likeCounts[postId] = (likeCounts[postId] ?? 0) + 1;
      }
      
      // Get current user's likes
      final currentUserId = supabase.auth.currentUser?.id;
      final userLikesResponse = currentUserId != null
          ? await supabase
              .from('post_likes')
              .select('post_id')
              .eq('user_id', currentUserId)
          : [];
      
      final Set<String> userLikedPostIds = {};
      for (var like in userLikesResponse) {
        userLikedPostIds.add(like['post_id'].toString());
      }
      
      // Process posts
      if (response != null && response is List) {
        final posts = (response as List).map((item) {
          final postId = item['id'].toString();
          
          // Get user profile data
          final profile = item['profiles'];
          String? firstName, lastName, userAvatar;
          
          if (profile is Map<String, dynamic>) {
            firstName = profile['first_name']?.toString();
            lastName = profile['last_name']?.toString();
            userAvatar = profile['profile_image_url']?.toString();
          } else if (profile is List && profile.isNotEmpty) {
            final firstProfile = profile[0];
            if (firstProfile is Map<String, dynamic>) {
              firstName = firstProfile['first_name']?.toString();
              lastName = firstProfile['last_name']?.toString();
              userAvatar = firstProfile['profile_image_url']?.toString();
            }
          }
          
          final userName = (firstName != null && lastName != null) 
              ? '$firstName $lastName'.trim()
              : (firstName ?? 'Anonymous');
          
          return FeedPost(
            id: postId,
            userId: item['user_id']?.toString() ?? '',
            mediaUrl: item['media_url']?.toString() ?? '',
            mediaType: item['media_type']?.toString() ?? 'image',
            caption: item['caption']?.toString(),
            createdAt: item['created_at'] != null 
                ? DateTime.parse(item['created_at'].toString())
                : DateTime.now(),
            userName: userName,
            userAvatar: userAvatar,
            likeCount: likeCounts[postId] ?? 0,
            isLikedByUser: userLikedPostIds.contains(postId),
          );
        }).toList();
        
        setState(() {
          feedPosts = posts;
          isLoading = false;
        });
      } else {
        setState(() {
          feedPosts = [];
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading feed posts: $e');
      setState(() {
        feedPosts = [];
        isLoading = false;
      });
    }
  }
  
  Future<void> _checkUserLikes() async {
    try {
      final currentUserId = supabase.auth.currentUser?.id;
      if (currentUserId == null || feedPosts.isEmpty) return;
      
      final userLikesResponse = await supabase
          .from('post_likes')
          .select('post_id')
          .eq('user_id', currentUserId);
      
      final Set<String> userLikedPostIds = {};
      for (var like in userLikesResponse) {
        userLikedPostIds.add(like['post_id'].toString());
      }
      
      setState(() {
        for (var post in feedPosts) {
          post.isLikedByUser = userLikedPostIds.contains(post.id);
        }
      });
    } catch (e) {
      print('Error checking user likes: $e');
    }
  }
  
  Future<void> _handleLike(FeedPost post) async {
    try {
      final currentUserId = supabase.auth.currentUser?.id;
      if (currentUserId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please login to like posts'),
            backgroundColor: Color(0xFFFF4D8D),
          ),
        );
        return;
      }
      
      if (post.isLikedByUser) {
        // Remove like
        await supabase
            .from('post_likes')
            .delete()
            .eq('post_id', post.id)
            .eq('user_id', currentUserId);
        
        setState(() {
          post.isLikedByUser = false;
          post.likeCount = post.likeCount - 1;
        });
      } else {
        // Add like
        await supabase
            .from('post_likes')
            .insert({
              'post_id': post.id,
              'user_id': currentUserId,
              'created_at': DateTime.now().toIso8601String(),
            });
        
        setState(() {
          post.isLikedByUser = true;
          post.likeCount = post.likeCount + 1;
        });
      }
    } catch (e) {
      print('Error handling like: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: const Color(0xFFFF4D8D),
        ),
      );
    }
  }
  
  void _showUploadOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4D8D).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.photo_library,
                  color: Color(0xFFFF4D8D),
                ),
              ),
              title: const Text(
                'Upload Photo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text(
                'Choose from gallery',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.pop(context);
                _showCaptionDialog(isVideo: false);
              },
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF00D4AA).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.video_library,
                  color: Color(0xFF00D4AA),
                ),
              ),
              title: const Text(
                'Upload Video',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text(
                'Choose from gallery',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.pop(context);
                _showCaptionDialog(isVideo: true);
              },
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Take Photo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text(
                'Use camera',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.pop(context);
                _showCaptionDialog(isVideo: false, fromCamera: true);
              },
            ),
          ],
        ),
      ),
    );
  }
  
  void _showCaptionDialog({required bool isVideo, bool fromCamera = false}) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color(0xFF1A1A1A),
            title: const Text(
              'Add a caption',
              style: TextStyle(color: Colors.white),
            ),
            content: TextField(
              controller: _captionController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF333333)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFFF4D8D)),
                ),
              ),
              maxLines: 3,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _captionController.clear();
                  Navigator.pop(context);
                },
                child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _uploadMedia(isVideo: isVideo, fromCamera: fromCamera);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D8D),
                ),
                child: const Text('Post'),
              ),
            ],
          );
        },
      ),
    );
  }
  
  Future<void> _uploadMedia({required bool isVideo, required bool fromCamera}) async {
    try {
      setState(() => isUploading = true);
      
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw Exception('Please login to post');
      }
      
      // Pick file based on source
      XFile? pickedFile;
      if (fromCamera) {
        pickedFile = await picker.pickImage(source: ImageSource.camera);
      } else {
        if (isVideo) {
          pickedFile = await picker.pickVideo(source: ImageSource.gallery);
        } else {
          pickedFile = await picker.pickImage(source: ImageSource.gallery);
        }
      }
      
      if (pickedFile == null) {
        setState(() => isUploading = false);
        return;
      }
      
      // Create user-specific folder path for RLS policies
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final extension = isVideo ? 'mp4' : pickedFile.path.split('.').last;
      final fileName = '${user.id}/feed_$timestamp.$extension';
      final bucketName = isVideo ? 'feed-videos' : 'feed-images';
      
      // Read file as bytes
      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      
      // Upload to storage with user folder
      await supabase.storage.from(bucketName).uploadBinary(
        fileName,
        bytes,
        fileOptions: FileOptions(
          upsert: true,
          contentType: isVideo ? 'video/mp4' : 'image/jpeg',
        ),
      );
      
      // Get public URL
      final publicUrl = supabase.storage.from(bucketName).getPublicUrl(fileName);
      
      // Create post in database
      await supabase.from('feed_posts').insert({
        'user_id': user.id,
        'media_url': publicUrl,
        'media_type': isVideo ? 'video' : 'image',
        'caption': _captionController.text,
        'created_at': DateTime.now().toIso8601String(),
      });
      
      // Clear caption and reload posts
      _captionController.clear();
      await _loadFeedPosts();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${isVideo ? 'Video' : 'Photo'} posted successfully!'),
          backgroundColor: const Color(0xFF00D4AA),
        ),
      );
    } catch (e) {
      print('Error creating post: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: const Color(0xFFFF4D8D),
        ),
      );
    } finally {
      setState(() => isUploading = false);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4D8D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
            onPressed: _showUploadOptions,
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF4D8D),
              ),
            )
          : isUploading
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Color(0xFFFF4D8D)),
                      SizedBox(height: 20),
                      Text(
                        'Uploading...',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              : feedPosts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.dynamic_feed,
                            size: 80,
                            color: Color(0xFF333333),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'No Posts Yet',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Be the first to share something!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: _showUploadOptions,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF4D8D),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add, size: 20),
                                SizedBox(width: 10),
                                Text(
                                  'Create Post',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _loadFeedPosts,
                      color: const Color(0xFFFF4D8D),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: feedPosts.length,
                        itemBuilder: (context, index) {
                          final post = feedPosts[index];
                          return FeedPostCard(
                            post: post,
                            onLike: () => _handleLike(post),
                          );
                        },
                      ),
                    ),
    );
  }
}

class FeedPost {
  final String id;
  final String userId;
  final String mediaUrl;
  final String mediaType;
  final String? caption;
  final DateTime createdAt;
  final String? userName;
  final String? userAvatar;
  int likeCount;
  bool isLikedByUser;
  
  FeedPost({
    required this.id,
    required this.userId,
    required this.mediaUrl,
    required this.mediaType,
    this.caption,
    required this.createdAt,
    this.userName,
    this.userAvatar,
    required this.likeCount,
    this.isLikedByUser = false,
  });
  
  factory FeedPost.fromJson(Map<String, dynamic> json) {
  // FIX 1: Handle likes data more safely
  int likeCount = 0;
  final likesData = json['likes'];
  
  if (likesData is List && likesData.isNotEmpty) {
    // Check if first element has 'count' property
    if (likesData[0] is Map<String, dynamic>) {
      final firstLike = likesData[0] as Map<String, dynamic>;
      if (firstLike.containsKey('count')) {
        likeCount = (firstLike['count'] as int?) ?? 0;
      }
    } else if (likesData[0] is int) {
      // If likesData is just a count number
      likeCount = likesData[0] as int;
    }
  } else if (likesData is Map<String, dynamic> && likesData.containsKey('count')) {
    // If likesData is a Map with count
    likeCount = (likesData['count'] as int?) ?? 0;
  } else if (likesData is int) {
    // If likesData is just a number
    likeCount = likesData;
  }
  
  // FIX 2: Handle profile data
  Map<String, dynamic>? profile;
  final profilesData = json['profiles'];
  
  if (profilesData is Map<String, dynamic>) {
    profile = profilesData;
  } else if (profilesData is List && profilesData.isNotEmpty) {
    // If it's a list, take the first one
    if (profilesData[0] is Map<String, dynamic>) {
      profile = profilesData[0] as Map<String, dynamic>;
    }
  }
  
  final firstName = profile?['first_name']?.toString() ?? '';
  final lastName = profile?['last_name']?.toString() ?? '';
  final userName = '$firstName $lastName'.trim();
  
  return FeedPost(
    id: json['id'].toString(),
    userId: json['user_id'].toString(),
    mediaUrl: json['media_url'].toString(),
    mediaType: json['media_type'].toString(),
    caption: json['caption']?.toString(),
    createdAt: DateTime.parse(json['created_at'].toString()),
    userName: userName.isNotEmpty ? userName : 'Anonymous',
    userAvatar: profile?['profile_image_url']?.toString(),
    likeCount: likeCount,
    isLikedByUser: false, // Will be updated separately
  );
}}

class FeedPostCard extends StatefulWidget {
  final FeedPost post;
  final VoidCallback onLike;
  
  const FeedPostCard({
    super.key,
    required this.post,
    required this.onLike,
  });
  
  @override
  State<FeedPostCard> createState() => _FeedPostCardState();
}

class _FeedPostCardState extends State<FeedPostCard> {
  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFF333333),
                  backgroundImage: post.userAvatar != null && post.userAvatar!.isNotEmpty
                      ? NetworkImage(post.userAvatar!)
                      : null,
                  child: post.userAvatar == null || post.userAvatar!.isEmpty
                      ? const Icon(Icons.person, color: Colors.white, size: 20)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.userName ?? 'Anonymous',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${_timeAgo(post.createdAt)} ago',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          
          // Media content
          if (post.mediaType == 'image')
            GestureDetector(
              onDoubleTap: widget.onLike,
              child: Container(
                height: 400,
                color: const Color(0xFF0A0A0A),
                child: Image.network(
                  post.mediaUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFFFF4D8D),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    print('Image load error: $error');
                    print('URL: ${post.mediaUrl}');
                    return Container(
                      color: const Color(0xFF0A0A0A),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                              size: 48,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Failed to load image',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(Icons.refresh),
                              label: const Text('Retry'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF4D8D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          else if (post.mediaType == 'video')
            Container(
              height: 400,
              color: const Color(0xFF0A0A0A),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF4D8D).withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Video - Tap to play',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          // Actions and caption
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onLike,
                      child: Icon(
                        post.isLikedByUser ? Icons.favorite : Icons.favorite_border,
                        color: post.isLikedByUser ? const Color(0xFFFF4D8D) : Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        // Add comment functionality
                      },
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        // Share functionality
                      },
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                // Like count
                Text(
                  '${post.likeCount} ${post.likeCount == 1 ? 'like' : 'likes'}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                
                // Caption
                if (post.caption != null && post.caption!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${post.userName} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: post.caption!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                // Comments preview
                if (post.caption == null || post.caption!.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'They: What happened to you?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}y';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}mo';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'just now';
    }
  }
}

// ================= IMAGE SERVICE =================
class ImageService {
  final supabase = Supabase.instance.client;
  final picker = ImagePicker();

  Future<String?> pickAndUploadImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return await uploadImage(File(pickedFile.path));
      }
      return null;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  Future<String?> takeAndUploadPhoto() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return await uploadImage(File(pickedFile.path));
      }
      return null;
    } catch (e) {
      print('Error taking photo: $e');
      return null;
    }
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) throw Exception('No user logged in');

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = '${user.id}_$timestamp.${imageFile.path.split('.').last}';
      
      // Upload to storage bucket named 'profile-images'
      await supabase.storage.from('profile-images').upload(
        fileName,
        imageFile,
        fileOptions: const FileOptions(upsert: true),
      );

      // Get the public URL
      final publicUrl = supabase.storage.from('profile-images').getPublicUrl(fileName);
      
      return publicUrl;
    } catch (e) {
      print('Error uploading image: $e');
      rethrow;
    }
  }
}

// ================= EXPLORE SCREEN (UPDATED - REMOVED UPLOAD) =================
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        // Removed the upload icon button from app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Removed the upload button and related content
            const SizedBox(height: 40),
            
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.explore,
                      size: 80,
                      color: Color(0xFF333333),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Explore Community',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Connect with people from around the world',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to community features
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4D8D),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Discover People',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.people,
              size: 80,
              color: const Color(0xFFFF4D8D),
            ),
            const SizedBox(height: 20),
            const Text(
              'AI Suggestions',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Personalized matches based on your neural profile',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String userName;

  const ChatScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                _buildSegment('RECENT', true),
                _buildSegment('UNREAD', false),
                _buildSegment('ANDA MATCH', false),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFF333333)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                _MessageItem(
                  name: 'aine',
                  message: 'Join 2 - You can now chat with $userName!',
                  time: 'JUST NOW',
                  isUnread: true,
                ),
                _MessageItem(
                  name: 'maria',
                  message: 'Join 2 - You matched with maria!',
                  time: 'LESS',
                  isUnread: false,
                ),
                _MessageItem(
                  name: 'crying soul',
                  message: 'Join 2 - You matched with Crying soul!',
                  time: 'JUST NOW',
                  isUnread: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegment(String text, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? const Color(0xFFFF4D8D) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? const Color(0xFFFF4D8D) : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isUnread;

  const _MessageItem({
    required this.name,
    required this.message,
    required this.time,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isUnread ? const Color(0xFFFF4D8D).withOpacity(0.05) : const Color(0xFF0A0A0A),
        border: const Border(
          bottom: BorderSide(
            color: const Color(0xFF333333),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: const Color(0xFFFF4D8D),
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isUnread ? Colors.white : Colors.grey,
            fontWeight: isUnread ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            if (isUnread)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: const Color(0xFFFF4D8D),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activity'),
          bottom: const TabBar(
            indicatorColor: const Color(0xFFFF4D8D),
            labelColor: const Color(0xFFFF4D8D),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Matches'),
              Tab(text: 'Likes'),
              Tab(text: 'Comments'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _AllTab(),
            _MatchesTab(),
            _LikesTab(),
            _CommentsTab(),
          ],
        ),
      ),
    );
  }
}

class _AllTab extends StatelessWidget {
  const _AllTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 80,
            color: Colors.grey[700],
          ),
          const SizedBox(height: 20),
          const Text(
            'All caught up',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'You have no new notifications.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4D8D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text(
              'Explore',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchesTab extends StatelessWidget {
  const _MatchesTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Matches Tab',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class _LikesTab extends StatelessWidget {
  const _LikesTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Likes Tab',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class _CommentsTab extends StatelessWidget {
  const _CommentsTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Comments Tab',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  final Map<String, dynamic>? userProfile;
  final String? profileImageUrl;
  final VoidCallback onProfileUpdate;
  final Function(String)? onImageUpdate;

  const SettingsScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    this.userProfile,
    this.profileImageUrl,
    required this.onProfileUpdate,
    this.onImageUpdate,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _ageController;
  late TextEditingController _bioController;
  final AuthService _authService = AuthService();
  final ImageService _imageService = ImageService();
  String? _currentProfileImageUrl;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.userProfile?['first_name']?.toString() ?? '',
    );
    _lastNameController = TextEditingController(
      text: widget.userProfile?['last_name']?.toString() ?? '',
    );
    _ageController = TextEditingController(
      text: widget.userProfile?['age']?.toString() ?? '',
    );
    _bioController = TextEditingController(
      text: widget.userProfile?['bio']?.toString() ?? '',
    );
    _currentProfileImageUrl = widget.profileImageUrl;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    try {
      await _authService.updateProfile(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        age: _ageController.text.trim().isNotEmpty ? int.tryParse(_ageController.text.trim()) : null,
        bio: _bioController.text.trim(),
        profileImageUrl: _currentProfileImageUrl,
      );
      
      widget.onProfileUpdate();
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully!'),
            backgroundColor: Color(0xFF00D4AA),
          ),
        );
      }
    } catch (e) {
      print('Error updating profile: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating profile: $e'),
            backgroundColor: const Color(0xFFFF4D8D),
          ),
        );
      }
    }
  }

  Future<void> _updateProfileImage(String imageUrl) async {
    try {
      await _authService.updateProfile(profileImageUrl: imageUrl);
      setState(() {
        _currentProfileImageUrl = imageUrl;
      });
      
      if (widget.onImageUpdate != null) {
        widget.onImageUpdate!(imageUrl);
      }
      
      widget.onProfileUpdate();
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile photo updated successfully!'),
            backgroundColor: Color(0xFF00D4AA),
          ),
        );
      }
    } catch (e) {
      print('Error updating profile image: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating photo: $e'),
            backgroundColor: const Color(0xFFFF4D8D),
          ),
        );
      }
    }
  }

  Future<void> _showImagePicker() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: const Color(0xFF1A1A1A),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: const Text('Choose from Gallery', style: TextStyle(color: Colors.white)),
              onTap: () async {
                Navigator.pop(context);
                final imageUrl = await _imageService.pickAndUploadImage();
                if (imageUrl != null) {
                  await _updateProfileImage(imageUrl);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text('Take Photo', style: TextStyle(color: Colors.white)),
              onTap: () async {
                Navigator.pop(context);
                final imageUrl = await _imageService.takeAndUploadPhoto();
                if (imageUrl != null) {
                  await _updateProfileImage(imageUrl);
                }
              },
            ),
            if (_currentProfileImageUrl != null && _currentProfileImageUrl!.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Remove Photo', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  await _updateProfileImage('');
                },
              ),
          ],
        ),
      ),
    );
  }

  // ====== NEW: Upload Photo Section ======
  Widget _buildUploadSection() {
    return Container(
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upload Photos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'ADD MORE PHOTOS TO YOUR PROFILE',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0A0A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF333333)),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.add_a_photo,
                  size: 40,
                  color: Colors.grey[600],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Upload Profile Photos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add more photos to showcase your personality',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _showImagePicker,
                  icon: const Icon(Icons.add_a_photo, size: 20),
                  label: const Text('Upload Photo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D8D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstName = widget.userProfile?['first_name']?.toString() ?? '';
    final lastName = widget.userProfile?['last_name']?.toString() ?? '';
    final fullName = '$firstName $lastName'.trim();
    final displayName = fullName.isNotEmpty ? fullName : widget.userName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Container(
            color: const Color(0xFF1A1A1A),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _showImagePicker,
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF333333),
                            image: _currentProfileImageUrl != null && _currentProfileImageUrl!.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(_currentProfileImageUrl!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: _currentProfileImageUrl == null || _currentProfileImageUrl!.isEmpty
                              ? const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF4D8D),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              displayName.isNotEmpty ? '$displayName, 25' : 'User, 25',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.userEmail,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _showEditProfileDialog();
                        },
                        icon: const Icon(Icons.edit, size: 16),
                        label: const Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF333333),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFF333333)),

          // ====== ADDED: Upload Photos Section ======
          _buildUploadSection(),
          const Divider(height: 1, color: Color(0xFF333333)),

          Container(
            color: const Color(0xFF1A1A1A),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lovatra Premium',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'GET PREMIUM FEATURES',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF4D8D), Color(0xFFFF6B35)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Unlock All Features',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'See who likes you, unlimited swipes, and more',
                              style: TextStyle(fontSize: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFFFF4D8D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('UPGRADE'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF333333))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF4D8D))),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF333333))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF4D8D))),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF333333))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF4D8D))),
                ),
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF333333))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF4D8D))),
                ),
                style: const TextStyle(color: Colors.white),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              _updateProfile();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4D8D),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  String _errorMessage = '';
  final AuthService _authService = AuthService();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        await _authService.register(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
        );

        setState(() => _isLoading = false);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created! Please sign in.'),
              backgroundColor: Color(0xFF00D4AA),
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      } catch (e) {
        setState(() {
          _errorMessage = e.toString().replaceAll('Exception: ', '');
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Join Lovatra', style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Icon(
                  Icons.favorite,
                  color: Color(0xFFFF4D8D),
                  size: 60,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Create Your Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Begin your journey to meaningful connections',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),

              if (_errorMessage.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4D8D).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFFF4D8D)),
                  ),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Color(0xFFFF4D8D),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              Text(
                'First Name',
                style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _firstNameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your first name',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFF4D8D), width: 2),
                  ),
                  prefixIcon: const Icon(Icons.person, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  if (value.length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              Text(
                'Last Name',
                style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _lastNameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your last name',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFF4D8D), width: 2),
                  ),
                  prefixIcon: const Icon(Icons.person_outline, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              Text(
                'Email Address',
                style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFF4D8D), width: 2),
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              Text(
                'Password',
                style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Create a password',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFF4D8D), width: 2),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              Row(
                children: [
                  Icon(Icons.info, color: Colors.grey[400], size: 16),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'By joining, you agree to our Terms of Service and Privacy Policy',
                      style: TextStyle(color: Colors.grey[400], fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D8D),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Color(0xFF00D4AA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscurePassword = true;
  String _errorMessage = '';
  final AuthService _authService = AuthService();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        await _authService.login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        setState(() => _isLoading = false);

        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainAppScreen()),
            (route) => false,
          );
        }
      } catch (e) {
        setState(() {
          _errorMessage = e.toString().replaceAll('Exception: ', '');
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Icon(
                  Icons.favorite,
                  color: Color(0xFFFF4D8D),
                  size: 70,
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Sign in to continue your journey',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),

              if (_errorMessage.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4D8D).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFFF4D8D)),
                  ),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Color(0xFFFF4D8D),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              Text(
                'Email Address',
                style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFF4D8D), width: 2),
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              Text(
                'Password',
                style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF1A1A1A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFFF4D8D), width: 2),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF00D4AA)),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D8D),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),

              const Center(
                child: Text(
                  'Or sign in with',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Google sign in coming soon'),
                          backgroundColor: Color(0xFF00D4AA),
                        ),
                      );
                    },
                    icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 40),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Apple sign in coming soon'),
                          backgroundColor: Color(0xFF00D4AA),
                        ),
                      );
                    },
                    icon: const Icon(Icons.apple, color: Colors.white, size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF00D4AA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final String firstName;
  final String email;

  const WelcomeScreen({
    super.key,
    required this.firstName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF4D8D), Color(0xFFFF6B35)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Welcome to Lovatra, $firstName!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Your neural profile journey begins now',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.psychology,
                      color: Color(0xFF00D4AA),
                      size: 40,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Next Step: Personality Test',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Complete your personality vector test to start finding meaningful matches',
                      style: TextStyle(color: Colors.grey[300]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainAppScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4D8D),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Enter Dating App',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainAppScreen()),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Skip for Now',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalityTestScreen extends StatefulWidget {
  const PersonalityTestScreen({super.key});

  @override
  State<PersonalityTestScreen> createState() => _PersonalityTestScreenState();
}

class _PersonalityTestScreenState extends State<PersonalityTestScreen> {
  int _currentQuestionIndex = 0;
  final List<String?> _userAnswers = [null, null, null];

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What defines your perfect evening?',
      'answers': ['City lights and cocktails', 'Starry skies and tents', 'Vinyl records and coffee', 'Wild parties and bass'],
      'icons': [Icons.location_city, Icons.nightlight_round, Icons.music_note, Icons.celebration],
      'vectorValues': [0.8, 0.3, 0.5, 0.9],
    },
    {
      'question': 'How do you approach life\'s challenges?',
      'answers': ['Calculated logic', 'Intuitive feeling', 'Collaborative effort', 'Fearless action'],
      'icons': [Icons.calculate, Icons.psychology, Icons.group, Icons.bolt],
      'vectorValues': [0.9, 0.7, 0.6, 0.8],
    },
    {
      'question': 'Choose your primary love language:',
      'answers': ['Words of affirmation', 'Quality time', 'Physical touch', 'Acts of service'],
      'icons': [Icons.chat_bubble, Icons.access_time, Icons.favorite, Icons.handyman],
      'vectorValues': [0.7, 0.8, 0.9, 0.6],
    },
  ];

  void _calculateResult() {
    List<double> personalityVector = [0.0, 0.0, 0.0, 0.0];
    
    for (int i = 0; i < _userAnswers.length; i++) {
      if (_userAnswers[i] != null) {
        int answerIndex = _questions[i]['answers'].indexOf(_userAnswers[i]!);
        if (answerIndex != -1) {
          List<double> weights = List<double>.from(_questions[i]['vectorValues']);
          for (int j = 0; j < personalityVector.length; j++) {
            personalityVector[j] += weights[j] * (answerIndex == j ? 1.0 : 0.3);
          }
        }
      }
    }

    double sum = personalityVector.reduce((a, b) => a + b);
    personalityVector = personalityVector.map((value) => value / sum).toList();

    int dominantIndex = 0;
    for (int i = 1; i < personalityVector.length; i++) {
      if (personalityVector[i] > personalityVector[dominantIndex]) {
        dominantIndex = i;
      }
    }

    const archetypes = ['The Urban Sophisticate', 'The Natural Adventurer', 'The Creative Introvert', 'The Social Energizer'];
    const descriptions = [
      'You thrive in metropolitan energy, value sophistication, and seek intellectual connections.',
      'Nature is your sanctuary. You find meaning in authenticity and deep conversations.',
      'You resonate with artistic depth and meaningful connections beyond surface level.',
      'You energize social spaces and connect through shared experiences.',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Center(
          child: Text('🧠 Neural Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFFFF4D8D).withOpacity(0.2), const Color(0xFF00D4AA).withOpacity(0.2)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      archetypes[dominantIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFF00D4AA), fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Icon(_questions[0]['icons'][dominantIndex], size: 50, color: const Color(0xFFFF4D8D)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                descriptions[dominantIndex],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[300], fontSize: 15),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A0A0A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text('Neural Compatibility', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: personalityVector[dominantIndex],
                      backgroundColor: const Color(0xFF333333),
                      color: const Color(0xFFFF4D8D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${(personalityVector[dominantIndex] * 100).toStringAsFixed(1)}% Match',
                      style: const TextStyle(color: Color(0xFF00D4AA), fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Retake', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4D8D),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'Go to Dating Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Personality Test', style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Question ${_currentQuestionIndex + 1}/3', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                Text('${((_currentQuestionIndex + 1) / 3 * 100).toStringAsFixed(0)}%', style: const TextStyle(color: Color(0xFF00D4AA), fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / 3,
                backgroundColor: const Color(0xFF333333),
                color: const Color(0xFFFF4D8D),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              currentQuestion['question'],
              style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, height: 1.2),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: (currentQuestion['answers'] as List).length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final answer = (currentQuestion['answers'] as List)[index];
                  final icon = (currentQuestion['icons'] as List<IconData>)[index];
                  final isSelected = _userAnswers[_currentQuestionIndex] == answer;
                  
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => setState(() => _userAnswers[_currentQuestionIndex] = answer),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFF4D8D).withOpacity(0.1) : const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? const Color(0xFFFF4D8D) : const Color(0xFF333333),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFFFF4D8D) : const Color(0xFF333333),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(icon, color: Colors.white, size: 20),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                answer,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF00D4AA), size: 24),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                if (_currentQuestionIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => _currentQuestionIndex--),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Color(0xFF333333)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back, size: 18),
                          SizedBox(width: 8),
                          Text('Back'),
                        ],
                      ),
                    ),
                  ),
                if (_currentQuestionIndex > 0) const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _userAnswers[_currentQuestionIndex] == null ? null : () {
                      if (_currentQuestionIndex < 2) {
                        setState(() => _currentQuestionIndex++);
                      } else {
                        _calculateResult();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4D8D),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      disabledBackgroundColor: const Color(0xFF333333),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentQuestionIndex < 2 ? 'Next' : 'See Results',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _currentQuestionIndex < 2 ? Icons.arrow_forward : Icons.psychology,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}