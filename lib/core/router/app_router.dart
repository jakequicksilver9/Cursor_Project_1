import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:my_flutter_app/features/auth/presentation/screens/login_screen.dart';
import 'package:my_flutter_app/features/auth/presentation/screens/register_screen.dart';
import 'package:my_flutter_app/features/home/presentation/screens/home_screen.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            final authProvider = context.watch<AuthProvider>();
            return authProvider.isAuthenticated
                ? const HomeScreen()
                : const LoginScreen();
          },
        );
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
} 