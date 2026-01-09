import 'package:blogapp/Core/secrete/App_Secrete.dart';
import 'package:blogapp/Features/Auth/Presentation/Pages/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Core/Theme/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
final supabase =  await Supabase.initialize(
    url: AppSecrete.supabaseUrl,
    anonKey: AppSecrete.supabaseanonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
