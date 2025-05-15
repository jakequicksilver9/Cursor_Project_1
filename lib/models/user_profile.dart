import 'package:cloud_firestore/cloud_firestore.dart';

enum UserType { surfer, guide }

class UserProfile {
  final String id;
  final String email;
  final String displayName;
  final UserType userType;
  final String? photoUrl;
  final String? bio;
  final int? experienceYears;
  final List<String>? preferredSpots;
  final List<String>? certifications;
  final double? rating;
  final int? totalReviews;
  final Map<String, dynamic>? guideDetails;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile({
    required this.id,
    required this.email,
    required this.displayName,
    required this.userType,
    this.photoUrl,
    this.bio,
    this.experienceYears,
    this.preferredSpots,
    this.certifications,
    this.rating,
    this.totalReviews,
    this.guideDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserProfile(
      id: doc.id,
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? '',
      userType: UserType.values.firstWhere(
        (e) => e.toString() == 'UserType.${data['userType']}',
        orElse: () => UserType.surfer,
      ),
      photoUrl: data['photoUrl'],
      bio: data['bio'],
      experienceYears: data['experienceYears'],
      preferredSpots: List<String>.from(data['preferredSpots'] ?? []),
      certifications: List<String>.from(data['certifications'] ?? []),
      rating: data['rating']?.toDouble(),
      totalReviews: data['totalReviews'],
      guideDetails: data['guideDetails'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'userType': userType.toString().split('.').last,
      'photoUrl': photoUrl,
      'bio': bio,
      'experienceYears': experienceYears,
      'preferredSpots': preferredSpots,
      'certifications': certifications,
      'rating': rating,
      'totalReviews': totalReviews,
      'guideDetails': guideDetails,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  UserProfile copyWith({
    String? id,
    String? email,
    String? displayName,
    UserType? userType,
    String? photoUrl,
    String? bio,
    int? experienceYears,
    List<String>? preferredSpots,
    List<String>? certifications,
    double? rating,
    int? totalReviews,
    Map<String, dynamic>? guideDetails,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      userType: userType ?? this.userType,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      experienceYears: experienceYears ?? this.experienceYears,
      preferredSpots: preferredSpots ?? this.preferredSpots,
      certifications: certifications ?? this.certifications,
      rating: rating ?? this.rating,
      totalReviews: totalReviews ?? this.totalReviews,
      guideDetails: guideDetails ?? this.guideDetails,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
} 