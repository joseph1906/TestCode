import 'package:flutter/material.dart';

void main() {
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
      ),
      home: const HomeScreen(),
      routes: {
        '/discover': (context) => const DiscoverPage(),
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/test': (context) => const PersonalityTestScreen(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

// ========== DISCOVER PAGE ==========
class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Discover', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeroSection(),
              const SizedBox(height: 40),
              _buildStatsSection(),
              const SizedBox(height: 60),
              _buildHowItWorksSection(),
              const SizedBox(height: 60),
              _buildAIFeaturesSection(),
              const SizedBox(height: 60),
              _buildCTASection(context),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Text(
            'DISCOVER SOULFUL CONNECTIONS',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[400],
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
                children: [
                  TextSpan(text: 'Find Love That\n'),
                  TextSpan(
                    text: 'Truly Resonates\n',
                    style: TextStyle(color: Color(0xFFFF4D8D)),
                  ),
                  TextSpan(text: 'With Your Core'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Text(
              'Lovatra\'s advanced AI goes beyond superficial matching. We analyze personality vectors to connect you with partners who share your values, passions, and vision for the future.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              // Navigate to signup
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4D8D), Color(0xFFFF6B35)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF4D8D).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bolt, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Text(
                    'Start Your Journey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        alignment: WrapAlignment.center,
        children: const [
          StatItem(
            number: '1.2M+',
            label: 'Souls Connected',
          ),
          StatItem(
            number: '92%',
            label: 'Match Satisfaction',
          ),
          StatItem(
            number: '78+',
            label: 'Countries',
          ),
          StatItem(
            number: '10K+',
            label: 'Success Stories',
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: const Text(
              'How Lovatra Discovers Your Perfect Match',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Text(
              'Our AI-powered process is designed to understand you on a deeper level, ensuring connections that go beyond the surface.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            children: const [
              HowItWorksStep(
                number: 1,
                icon: Icons.psychology,
                title: 'Personality Vector Analysis',
                description: 'Complete our unique personality assessment that maps your core traits, values, and preferences.',
              ),
              SizedBox(height: 24),
              HowItWorksStep(
                number: 2,
                icon: Icons.account_tree,
                title: 'Neural Matching Algorithm',
                description: 'Our AI compares your vector with millions of others, identifying matches with complementary personalities.',
              ),
              SizedBox(height: 24),
              HowItWorksStep(
                number: 3,
                icon: Icons.favorite,
                title: 'Meaningful Introductions',
                description: 'We facilitate connections based on shared interests and compatible communication styles.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAIFeaturesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A).withOpacity(0.5),
      ),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: const Text(
              'Advanced AI Features',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Text(
              'Powered by cutting-edge technology to revolutionize how you find love.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: const [
              AIFeatureCard(
                icon: Icons.auto_awesome,
                title: 'Predictive Compatibility',
                description: 'Our AI predicts long-term compatibility based on behavioral patterns.',
              ),
              AIFeatureCard(
                icon: Icons.chat,
                title: 'Communication Analysis',
                description: 'Understand communication styles for meaningful conversations.',
              ),
              AIFeatureCard(
                icon: Icons.public,
                title: 'Global Connection',
                description: 'Break geographical barriers while considering cultural compatibility.',
              ),
              AIFeatureCard(
                icon: Icons.security,
                title: 'Privacy-First Approach',
                description: 'Your data is encrypted and never shared without your consent.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: const Text(
              'Ready to Discover Meaningful Connections?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Text(
              'Join 1.2 million souls who have found deeper connections through Lovatra\'s AI-powered matching.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 50),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4D8D), Color(0xFFFF6B35)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF4D8D).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, color: Colors.white, size: 22),
                  SizedBox(width: 12),
                  Text(
                    'Create Your Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Free forever. Premium features available.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}

// ========== STATITEM WIDGET ==========
class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 140),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFFF4D8D), Color(0xFF00D4AA)],
            ).createShader(bounds),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[400],
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ========== HOW IT WORKS STEP WIDGET ==========
class HowItWorksStep extends StatelessWidget {
  final int number;
  final IconData icon;
  final String title;
  final String description;

  const HowItWorksStep({
    super.key,
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -10,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4D8D), Color(0xFF00D4AA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: const Color(0xFFFF4D8D),
                size: 40,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[300],
                  height: 1.6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== AI FEATURE CARD WIDGET ==========
class AIFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const AIFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFF4D8D).withOpacity(0.1),
                  const Color(0xFF00D4AA).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFFF4D8D),
              size: 28,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[300],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

// ========== HOME SCREEN (Simplified) ==========
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        title: const Text('Lovatra', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.explore),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DiscoverPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              color: Color(0xFFFF4D8D),
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Lovatra',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'AI-Powered Dating',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiscoverPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF4D8D),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Discover Soulmates',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Color(0xFF00D4AA)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0A0A0A),
        selectedItemColor: const Color(0xFFFF4D8D),
        unselectedItemColor: Colors.grey[400],
        currentIndex: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiscoverPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
      ),
    );
  }
}

// ========== BASIC VERSIONS OF OTHER SCREENS ==========

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const Center(
        child: Text('Sign Up Screen'),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text('Login Screen'),
      ),
    );
  }
}

class PersonalityTestScreen extends StatelessWidget {
  const PersonalityTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personality Test'),
      ),
      body: const Center(
        child: Text('Personality Test Screen'),
      ),
    );
  }
}