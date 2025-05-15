import 'package:flutter/material.dart';
import 'package:my_flutter_app/features/surf_spots/domain/entities/surf_spot.dart';
import 'package:my_flutter_app/features/surf_spots/presentation/widgets/surf_spot_card.dart';

class SurfSpotsTab extends StatelessWidget {
  const SurfSpotsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // TODO: Replace with actual surf spots from repository
        itemBuilder: (context, index) {
          // TODO: Replace with actual surf spot data
          final spot = SurfSpot(
            id: 'spot_$index',
            name: 'Surf Spot ${index + 1}',
            location: 'Location ${index + 1}',
            description: 'A beautiful surf spot with perfect waves.',
            difficulty: 'Intermediate',
            rating: 4.5,
            imageUrl: 'https://example.com/surf_spot_$index.jpg',
          );
          
          return SurfSpotCard(spot: spot);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement search/filter functionality
        },
        child: const Icon(Icons.search),
      ),
    );
  }
} 