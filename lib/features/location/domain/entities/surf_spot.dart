class SurfSpot {
  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String country;
  final String region;
  final List<String> waveTypes;
  final String difficultyLevel;
  final Map<String, dynamic>? weatherData;
  final Map<String, dynamic>? waveConditions;
  final List<String>? images;
  final bool isVerified;

  SurfSpot({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.region,
    required this.waveTypes,
    required this.difficultyLevel,
    this.weatherData,
    this.waveConditions,
    this.images,
    this.isVerified = false,
  });

  String get fullLocation => '$region, $country';
} 