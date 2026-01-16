import 'package:blogapp/Core/secrete/App_Secrete.dart';
import 'package:blogapp/Features/Auth/Presentation/Pages/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Core/Theme/Theme.dart';
import 'Features/Auth/Data/datasource/auth_datasource.dart';
import 'Features/Auth/Domain/usecase/user_sign_up.dart';
import 'Features/Auth/Presentation/bloc/auth_bloc.dart';
import 'Features/Repository/auth_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrete.supabaseUrl,
    anonKey: AppSecrete.supabaseAnonKey,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              AuthRepositoryImpl(AuthDatasourceImpl(supabase.client)),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
