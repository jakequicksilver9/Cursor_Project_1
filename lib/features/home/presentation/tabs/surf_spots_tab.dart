import 'package:flutter/material.dart';
import 'package:my_flutter_app/features/location/domain/entities/surf_spot.dart';

class SurfSpotsTab extends StatelessWidget {
  const SurfSpotsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search surf spots...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 10, // TODO: Replace with actual data
            itemBuilder: (context, index) {
              return SurfSpotCard(
                spot: SurfSpot(
                  id: 'spot_$index',
                  name: 'Surf Spot ${index + 1}',
                  description: 'A beautiful surf spot with perfect waves',
                  latitude: 0.0,
                  longitude: 0.0,
                  country: 'Country',
                  region: 'Region',
                  waveTypes: ['Beach Break', 'Reef Break'],
                  difficultyLevel: 'Intermediate',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SurfSpotCard extends StatelessWidget {
  final SurfSpot spot;

  const SurfSpotCard({
    Key? key,
    required this.spot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (spot.images?.isNotEmpty ?? false)
            Image.network(
              spot.images!.first,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spot.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  spot.fullLocation,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  spot.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Chip(
                      label: Text(spot.difficultyLevel),
                      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                    const SizedBox(width: 8),
                    ...spot.waveTypes.map(
                      (type) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(type),
                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to spot details
                  },
                  child: const Text('View Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 