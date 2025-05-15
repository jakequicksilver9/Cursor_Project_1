import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:my_flutter_app/features/auth/domain/entities/user.dart';
import 'package:my_flutter_app/features/auth/domain/entities/user_role.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  // Convert Firebase User to our User entity
  User? _userFromFirebase(firebase_auth.User? user) {
    if (user == null) return null;
    return User(
      id: user.uid,
      email: user.email,
      name: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  // Get current user
  User? get currentUser => _userFromFirebase(_auth.currentUser);

  // Auth state changes stream
  Stream<User?> get authStateChanges => 
      _auth.authStateChanges().map(_userFromFirebase);

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(result.user);
    } catch (e) {
      rethrow;
    }
  }

  // Register with email and password
  Future<User?> registerWithEmailAndPassword(
      String email, String password, String name, UserRole role) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update display name
      await userCredential.user?.updateDisplayName(name);

      // Create user profile in Firestore
      await _createUserProfile(
        userCredential.user!.uid,
        email,
        name,
        role,
      );

      return _userFromFirebase(userCredential.user);
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Create user profile in Firestore
  Future<void> _createUserProfile(
      String uid, String email, String name, UserRole role) async {
    // TODO: Implement Firestore user profile creation
  }
} 