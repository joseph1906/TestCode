import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;

class ImageService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();

  // Check if bucket exists, create if not
  Future<void> _ensureBucketExists() async {
    try {
      // Try to list buckets to check if ours exists
      final buckets = await _supabase.storage.listBuckets();
      final bucketExists = buckets.any((bucket) => bucket.id == 'profile-images');
      
      if (!bucketExists) {
        print('Creating profile-images bucket...');
        // Create the bucket with public access
        await _supabase.storage.createBucket(
          'profile-images',
        );
        print('Bucket created successfully');
      } else {
        print('Bucket already exists');
      }
      
      // Set bucket policies to allow public read access
      await _supabase.storage.from('profile-images').list();
    } catch (e) {
      print('Error ensuring bucket exists: $e');
      // Continue anyway, the bucket might already exist
    }
  }

  // Pick image from gallery
  Future<XFile?> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1024,  // Resize to reduce upload size
        maxHeight: 1024,
      );
      return image;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  // Take photo with camera
  Future<XFile?> takePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );
      return image;
    } catch (e) {
      print('Error taking photo: $e');
      return null;
    }
  }

  // Upload image to Supabase Storage
  Future<String?> uploadImage(File imageFile) async {
    try {
      // Ensure bucket exists first
      await _ensureBucketExists();
      
      final user = _supabase.auth.currentUser;
      if (user == null) {
        print('No user logged in');
        return null;
      }

      // Check file size (limit to 5MB)
      final fileSize = await imageFile.length();
      if (fileSize > 5 * 1024 * 1024) {
        print('File too large: ${fileSize / (1024 * 1024)}MB');
        return null;
      }

      // Create unique filename
      final fileName = 'profile_${user.id}_${DateTime.now().millisecondsSinceEpoch}${path.extension(imageFile.path)}';
      
      print('Uploading image: $fileName, size: ${fileSize / 1024}KB');
      
      // Upload to Supabase Storage
      await _supabase.storage
          .from('profile-images')
          .upload(fileName, imageFile, fileOptions: FileOptions(
            upsert: true,  // Overwrite if exists
            contentType: 'image/${path.extension(imageFile.path).toLowerCase().replaceAll('.', '')}',
          ));

      // Get public URL
      final String publicUrl = _supabase.storage
          .from('profile-images')
          .getPublicUrl(fileName);

      print('Upload successful: $publicUrl');
      return publicUrl;
    } catch (e) {
      print('Error uploading image: $e');
      if (e.toString().contains('Bucket not found')) {
        print('Bucket does not exist. Please create it in Supabase Dashboard');
      }
      return null;
    }
  }

  // Delete image from storage
  Future<void> deleteImage(String imageUrl) async {
    try {
      final fileName = imageUrl.split('/').last;
      await _supabase.storage
          .from('profile-images')
          .remove([fileName]);
      print('Image deleted: $fileName');
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  // Pick and upload image from gallery
  Future<String?> pickAndUploadImage() async {
    try {
      final image = await pickImage();
      if (image == null) {
        print('No image selected');
        return null;
      }

      final imageFile = File(image.path);
      return await uploadImage(imageFile);
    } catch (e) {
      print('Error in pickAndUploadImage: $e');
      return null;
    }
  }

  // Take and upload photo from camera
  Future<String?> takeAndUploadPhoto() async {
    try {
      final image = await takePhoto();
      if (image == null) {
        print('No photo taken');
        return null;
      }

      final imageFile = File(image.path);
      return await uploadImage(imageFile);
    } catch (e) {
      print('Error in takeAndUploadPhoto: $e');
      return null;
    }
  }
}