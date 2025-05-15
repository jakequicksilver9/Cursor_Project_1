import 'package:my_flutter_app/features/auth/domain/entities/user.dart';
import 'package:my_flutter_app/features/guide/domain/entities/guide_profile.dart';

enum BookingStatus {
  pending,
  confirmed,
  completed,
  cancelled,
  refunded,
}

class Booking {
  final String id;
  final User surfer;
  final GuideProfile guide;
  final DateTime startTime;
  final DateTime endTime;
  final String surfSpot;
  final String sessionType;
  final double totalAmount;
  final double commissionAmount;
  final BookingStatus status;
  final DateTime createdAt;
  final String? notes;

  Booking({
    required this.id,
    required this.surfer,
    required this.guide,
    required this.startTime,
    required this.endTime,
    required this.surfSpot,
    required this.sessionType,
    required this.totalAmount,
    required this.commissionAmount,
    required this.status,
    required this.createdAt,
    this.notes,
  });

  double get guideEarnings => totalAmount - commissionAmount;
  Duration get duration => endTime.difference(startTime);
} 