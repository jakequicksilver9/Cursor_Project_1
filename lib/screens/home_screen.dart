import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../navigation/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Surf Guide'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.profile);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, AppRouter.login);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user?.displayName ?? 'Surfer'}!'),
            const SizedBox(height: 20),
            if (authProvider.userProfile?.userType == UserType.surfer)
              ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to spot discovery
                },
                child: const Text('Find Surf Spots'),
              )
            else
              ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to guide dashboard
                },
                child: const Text('Guide Dashboard'),
              ),
          ],
        ),
      ),
    );
  }
} 