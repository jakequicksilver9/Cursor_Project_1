import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/core/router/app_router.dart';
import 'package:my_flutter_app/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_flutter_app/features/auth/presentation/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyClHGZfqEOlJUg27aY73BlXnfLEIk_S-zI",
        authDomain: "surf-guide-app-b1d93.firebaseapp.com",
        projectId: "surf-guide-app-b1d93",
        storageBucket: "surf-guide-app-b1d93.firebasestorage.app",
        messagingSenderId: "48847520864",
        appId: "1:48847520864:web:d8a16012b9dc85840c6f05",
        measurementId: "G-2H6T2FXS76",
      ),
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Surf Guide App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.initialRoute,
          );
        },
      ),
    );
  }
}
