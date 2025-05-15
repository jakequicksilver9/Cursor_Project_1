import 'package:my_flutter_app/features/auth/domain/entities/user.dart';

class GuideProfile {
  final String id;
  final User user;
  final String bio;
  final List<String> certifications;
  final List<String> languages;
  final double hourlyRate;
  final List<String> surfSpots;
  final Map<String, dynamic> availability;
  final List<String> sessionTypes;
  final int yearsOfExperience;
  final bool isAvailable;

  GuideProfile({
    required this.id,
    required this.user,
    required this.bio,
    required this.certifications,
    required this.languages,
    required this.hourlyRate,
    required this.surfSpots,
    required this.availability,
    required this.sessionTypes,
    required this.yearsOfExperience,
    this.isAvailable = true,
  });

  double get commissionRate => 0.15; // 15% commission rate
} 