import 'package:supabase_flutter/supabase_flutter.dart';
import 'database_service.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;
  final DatabaseService _dbService = DatabaseService();

  Future<AuthResponse> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      print('🚀 REGISTER: Starting registration for: $email');
      
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      print('✅ REGISTER: Auth user created: ${response.user?.id}');
      
      if (response.user != null) {
        await _createUserInDatabaseTable(
          userId: response.user!.id,
          email: email,
          firstName: firstName,
          lastName: lastName,
        );
      }

      return response;
    } catch (e) {
      print('❌ REGISTER Error: $e');
      rethrow;
    }
  }

  Future<void> _createUserInDatabaseTable({
    required String userId,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      print('📝 Creating database record for user: $userId');
      
      final now = DateTime.now().toIso8601String();
      
      await supabase.from('users').insert({
        'id': userId, 
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'created_at': now,
        'updated_at': now,
      });
      
      print('✅ Database record created successfully for: $email');
      
      final check = await supabase
          .from('users')
          .select()
          .eq('id', userId)
          .maybeSingle();
          
      if (check != null) {
        print('✅ VERIFIED: User found in database table');
      } else {
        print('❌ WARNING: User not found in database table after insert');
      }
    } catch (e) {
      print('❌ ERROR creating database record: $e');
      print('User ID: $userId, Email: $email');
      rethrow; 
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      print('🔑 LOGIN: Starting login for: $email');
      
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      print('✅ LOGIN: Successful for user: ${response.user?.id}');
      
      if (response.user != null) {
        await _ensureUserInDatabaseTable(response.user!);
      }

      return response;
    } catch (e) {
      print('❌ LOGIN Error: $e');
      rethrow;
    }
  }

  Future<void> _ensureUserInDatabaseTable(User user) async {
    try {
      print('🔍 Checking if user exists in database table: ${user.id}');
      
      final existingUser = await supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (existingUser == null) {
        print('⚠️ User not found in database table, creating...');
        
        final metadata = user.userMetadata ?? {};
        final firstName = metadata['first_name']?.toString() ?? 'User';
        final lastName = metadata['last_name']?.toString() ?? '';
        
        await _createUserInDatabaseTable(
          userId: user.id,
          email: user.email ?? '',
          firstName: firstName,
          lastName: lastName,
        );
      } else {
        print('✅ User already exists in database table');
      }
    } catch (e) {
      print('⚠️ Error ensuring user in database: $e');
    }
  }

  Future<Map<String, dynamic>?> getCurrentUserProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        print('❌ getCurrentUserProfile: No user logged in');
        return null;
      }

      print('👤 Getting profile for user: ${user.id}');
      
      final profile = await supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (profile != null) {
        print('✅ Found profile in database table');
        return profile;
      } else {
        print('❌ Profile not found in database table');
        return null;
      }
    } catch (e) {
      print('❌ Error in getCurrentUserProfile: $e');
      return null;
    }
  }

  
  Future<void> resetPassword({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      print('Reset password error: $e');
      rethrow;
    }
  }

  Future<UserResponse> updatePassword({required String newPassword}) async {
    try {
      final response = await supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      return response;
    } catch (e) {
      print('Update password error: $e');
      rethrow;
    }
  }

  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    int? age,
    String? bio,
    String? profileImageUrl,
  }) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) throw Exception('No user logged in');

      final updateData = <String, dynamic>{};
      
      if (firstName != null) updateData['first_name'] = firstName;
      if (lastName != null) updateData['last_name'] = lastName;
      if (age != null) updateData['age'] = age;
      if (bio != null) updateData['bio'] = bio;
      if (profileImageUrl != null) updateData['profile_image_url'] = profileImageUrl;
      
      updateData['updated_at'] = DateTime.now().toIso8601String();

      await supabase
          .from('users')
          .update(updateData)
          .eq('id', user.id);

      if (firstName != null || lastName != null) {
        final metadata = <String, dynamic>{};
        if (firstName != null) metadata['first_name'] = firstName;
        if (lastName != null) metadata['last_name'] = lastName;
        
        await supabase.auth.updateUser(
          UserAttributes(data: metadata),
        );
      }
    } catch (e) {
      print('Update profile error: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      print('Logout error: $e');
      rethrow;
    }
  }

  User? getCurrentUser() {
    return supabase.auth.currentUser;
  }

  Session? getCurrentSession() {
    return supabase.auth.currentSession;
  }

  bool isUserLoggedIn() {
    return supabase.auth.currentUser != null;
  }

  String? getUserEmail() {
    return supabase.auth.currentUser?.email;
  }

  Future<String?> getUserFullName() async {
    try {
      final profile = await getCurrentUserProfile();
      if (profile != null) {
        final firstName = profile['first_name']?.toString() ?? '';
        final lastName = profile['last_name']?.toString() ?? '';
        return '$firstName $lastName'.trim();
      }
      return null;
    } catch (e) {
      print('Error getting user full name: $e');
      return null;
    }
  }

  Future<bool> hasCompleteProfile() async {
    try {
      final profile = await getCurrentUserProfile();
      if (profile == null) return false;
      
      final firstName = profile['first_name']?.toString().trim() ?? '';
      final lastName = profile['last_name']?.toString().trim() ?? '';
      
      return firstName.isNotEmpty && lastName.isNotEmpty;
    } catch (e) {
      print('Error checking complete profile: $e');
      return false;
    }
  }

  Future<void> deleteAccount() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) throw Exception('No user logged in');

      await supabase
          .from('users')
          .delete()
          .eq('id', user.id);

      await logout();
      
    } catch (e) {
      print('Delete account error: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getMatches() async {
    return await _dbService.getMatches();
  }

  Future<List<Map<String, dynamic>>> getDiscoverProfiles() async {
    return await _dbService.getDiscoverProfiles();
  }

  Future<bool> likeUser(String likedUserId) async {
    return await _dbService.likeUser(likedUserId);
  }

  Future<List<Map<String, dynamic>>> getLikedProfiles() async {
    return await _dbService.getLikedProfiles();
  }

  String? getCurrentUserId() {
    return supabase.auth.currentUser?.id;
  }
}