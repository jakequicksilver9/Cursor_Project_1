import 'package:flutter/material.dart';
import 'package:my_flutter_app/features/auth/data/services/auth_service.dart';
import 'package:my_flutter_app/features/auth/domain/entities/user_role.dart';
import 'package:my_flutter_app/features/surf_spots/presentation/screens/surf_spots_tab.dart';
import 'package:my_flutter_app/features/bookings/presentation/screens/bookings_tab.dart';
import 'package:my_flutter_app/features/profile/presentation/screens/profile_tab.dart';
import 'package:my_flutter_app/features/guide/presentation/screens/guide_dashboard_tab.dart';
import 'package:my_flutter_app/features/guide/presentation/screens/guide_bookings_tab.dart';
import 'package:my_flutter_app/features/guide/presentation/screens/guide_profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _authService = AuthService();

  final List<Widget> _surferTabs = [
    const SurfSpotsTab(),
    const BookingsTab(),
    const ProfileTab(),
  ];

  final List<Widget> _guideTabs = [
    const GuideDashboardTab(),
    const GuideBookingsTab(),
    const GuideProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final isGuide = _authService.currentUser?.role == UserRole.guide;
    final tabs = isGuide ? _guideTabs : _surferTabs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Surf Guide'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: isGuide
            ? const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]
            : const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.beach_access),
                  label: 'Spots',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
      ),
    );
  }
} 