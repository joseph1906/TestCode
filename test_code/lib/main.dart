import 'package:flutter/material.dart';
import 'dart:async';

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
    );
  }
}

// ========== HOME SCREEN ==========
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
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 48),
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

// ========== REUSABLE COMPONENTS ==========
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

// ========== SIGNUP SCREEN ==========
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

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      // Simulate API call and OTP generation
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() => _isLoading = false);
      
      // Navigate to OTP verification screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerificationScreen(
            email: _emailController.text,
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            password: _passwordController.text,
          ),
        ),
      );
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
              
              // First Name Field
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
              
              // Last Name Field
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
              
              // Email Field
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
              
              // Password Field
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
              
              // Terms Agreement
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
              
              // Create Account Button
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
              
              // Login Link
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

// ========== OTP VERIFICATION SCREEN ==========
class OTPVerificationScreen extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  const OTPVerificationScreen({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isLoading = false;
  bool _isResending = false;
  int _timerCount = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    
    // Setup focus node listeners
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(() {
        if (_otpControllers[i].text.isNotEmpty && i < _otpControllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
      });
      
      // Allow backspace navigation
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus && _otpControllers[i].text.isEmpty && i > 0) {
          _focusNodes[i - 1].requestFocus();
        }
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerCount > 0) {
        setState(() {
          _timerCount--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendOTP() {
    setState(() {
      _isResending = true;
      _timerCount = 60;
    });

    // Simulate OTP resend API call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isResending = false);
      _startTimer();
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New OTP sent to your email'),
          backgroundColor: Color(0xFF00D4AA),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  Future<void> _verifyOTP() async {
    String enteredOTP = _otpControllers.map((c) => c.text).join();
    
    if (enteredOTP.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the complete 6-digit OTP'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simulate OTP verification API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    // For demo purposes, accept any 6-digit code
    if (enteredOTP.length == 6) {
      // Navigate to Welcome Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(
            firstName: widget.firstName,
            email: widget.email,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _maskedEmail(String email) {
    if (email.length < 5) return email;
    final parts = email.split('@');
    if (parts.length != 2) return email;
    
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 2) {
      return '${username.substring(0, 1)}***@$domain';
    }
    
    final visiblePart = username.substring(0, 2);
    return '$visiblePart***@$domain';
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer.cancel();
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
        title: const Text('Verify Email', style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Icon(
                Icons.verified_user,
                color: Color(0xFF00D4AA),
                size: 80,
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Verify Your Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Enter the 6-digit code sent to',
                style: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                _maskedEmail(widget.email),
                style: const TextStyle(
                  color: Color(0xFF00D4AA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            // OTP Input Fields
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextFormField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
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
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF333333)),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          _focusNodes[index + 1].requestFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                        
                        // Auto-submit when all fields are filled
                        if (index == 5 && value.isNotEmpty) {
                          bool allFilled = _otpControllers.every((controller) => controller.text.isNotEmpty);
                          if (allFilled) {
                            _verifyOTP();
                          }
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 30),
            
            // Timer and Resend
            Center(
              child: Column(
                children: [
                  Text(
                    _timerCount > 0
                        ? 'Resend code in $_timerCount seconds'
                        : 'Didn\'t receive the code?',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  const SizedBox(height: 10),
                  if (_timerCount == 0)
                    TextButton(
                      onPressed: _isResending ? null : _resendOTP,
                      child: _isResending
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Color(0xFF00D4AA),
                              ),
                            )
                          : const Text(
                              'Resend OTP',
                              style: TextStyle(
                                color: Color(0xFF00D4AA),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Verify Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _verifyOTP,
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
                        'Verify & Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Email Not Correct
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Email not correct? Go back',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========== LOGIN SCREEN ==========
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

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() => _isLoading = false);
      
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    }
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
              
              // Email Field
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
              
              // Password Field
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
              
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password reset feature would open here'),
                        backgroundColor: Color(0xFF00D4AA),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF00D4AA)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              // Sign In Button
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
              
              // Divider
              const Center(
                child: Text(
                  'Or sign in with',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              
              // Social Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Google sign in would open here'),
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
                          content: Text('Apple sign in would open here'),
                          backgroundColor: Color(0xFF00D4AA),
                        ),
                      );
                    },
                    icon: const Icon(Icons.apple, color: Colors.white, size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              // Sign Up Link
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

// ========== WELCOME SCREEN ==========
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
              const Text(
                'Your email has been successfully verified!',
                style: TextStyle(
                  color: Color(0xFF00D4AA),
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
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
                          MaterialPageRoute(builder: (context) => const PersonalityTestScreen()),
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
                        'Start Personality Test',
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
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Explore First',
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

// ========== PERSONALITY TEST SCREEN ==========
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
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4D8D),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'View Matches',
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