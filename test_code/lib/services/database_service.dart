import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> getOrCreateUserProfile({
    required String firstName,
    required String lastName,
  }) async {
    final user = supabase.auth.currentUser;
    if (user == null) throw Exception('No user logged in');

    try {
      print('📋 getOrCreateUserProfile called for: ${user.id}');
      
      final existing = await supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (existing != null) {
        print('✅ User already exists in database');
        return existing;
      }

      print('⚠️ User not found in database, creating now...');
      
      final now = DateTime.now().toIso8601String();
      await supabase.from('users').insert({
        'id': user.id,
        'email': user.email ?? '',
        'first_name': firstName,
        'last_name': lastName,
        'created_at': now,
        'updated_at': now,
      });

     final newProfile = await supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .single();
          
      return newProfile;
    } catch (e) {
      print('❌ Error in getOrCreateUserProfile: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getDiscoverProfiles() async {
    final user = supabase.auth.currentUser;
    if (user == null) return [];

    try {
      final likedResponse = await supabase
          .from('likes')
          .select('liked_id')
          .eq('liker_id', user.id);

      final likedIds = [...likedResponse.map((l) => l['liked_id']), user.id];

      var query = supabase
          .from('users')
          .select()
          .neq('id', user.id);

      if (likedIds.isNotEmpty) {
        query = query.not('id', 'in', likedIds);
      }

      final response = await query.limit(10);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error getting discover profiles: $e');
      return [];
    }
  }

  Future<bool> likeUser(String likedUserId) async {
    final user = supabase.auth.currentUser;
    if (user == null) return false;

    try {
      await supabase.from('likes').insert({
        'liker_id': user.id,
        'liked_id': likedUserId,
      });

      final mutualLike = await supabase
          .from('likes')
          .select()
          .eq('liker_id', likedUserId)
          .eq('liked_id', user.id)
          .maybeSingle();

      if (mutualLike != null) {
        final user1Id = user.id.compareTo(likedUserId) < 0 ? user.id : likedUserId;
        final user2Id = user.id.compareTo(likedUserId) < 0 ? likedUserId : user.id;
        
        await supabase.from('matches').upsert({
          'user1_id': user1Id,
          'user2_id': user2Id,
        }, onConflict: 'user1_id,user2_id');
        return true;
      }

      return false;
    } catch (e) {
      print('Error liking user: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getMatches() async {
    final user = supabase.auth.currentUser;
    if (user == null) return [];

    try {
      final response = await supabase
          .from('matches')
          .select('''
            *,
            user1:users!matches_user1_id_fkey(id, first_name, last_name),
            user2:users!matches_user2_id_fkey(id, first_name, last_name)
          ''')
          .or('user1_id.eq.${user.id},user2_id.eq.${user.id}');

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error getting matches: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getLikedProfiles() async {
    final user = supabase.auth.currentUser;
    if (user == null) return [];

    try {
      final response = await supabase
          .from('likes')
          .select('''
            liked_id,
            user:users!likes_liked_id_fkey(id, first_name, last_name)
          ''')
          .eq('liker_id', user.id);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error getting liked profiles: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getUserById(String userId) async {
    try {
      final response = await supabase
          .from('users')
          .select()
          .eq('id', userId)
          .maybeSingle();
      return response;
    } catch (e) {
      print('Error getting user by ID: $e');
      return null;
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> updates) async {
    final user = supabase.auth.currentUser;
    if (user == null) throw Exception('No user logged in');

    try {
      await supabase
          .from('users')
          .update({
            ...updates,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', user.id);
    } catch (e) {
      print('Error updating user profile: $e');
      rethrow;
    }
  }
}