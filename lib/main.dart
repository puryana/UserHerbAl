import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:herbal/core/consts/theme_data.dart';
import 'package:herbal/core/providers/fav_providers.dart';
import 'package:herbal/core/providers/history_provider.dart';
import 'package:herbal/core/providers/ramuan_providers.dart';
import 'package:herbal/core/providers/theme_provider.dart';
import 'package:herbal/core/providers/user_provider.dart';
import 'package:herbal/root_screen.dart';
import 'package:herbal/view/screens/auth/login.dart';
import 'package:herbal/view/screens/auth/registrasi.dart';
import 'package:provider/provider.dart';

Future main() async { 
    WidgetsFlutterBinding.ensureInitialized(); 
    await Firebase.initializeApp( 
      options: kIsWeb || Platform.isAndroid ? 
        FirebaseOptions( 
          apiKey: "AIzaSyCKXJux3h5DaDiTiqtls4fdSUqf9XVdZH0", 
          appId: "1:773295279022:android:1636730fd2900d0187963f", 
          messagingSenderId: "773295279022", 
          projectId: "herbal-ab41a", 
          storageBucket: "herbal-ab41a.firebasestorage.app", 
        ) 
      : null, 
    ); 
    runApp( 
      const MyApp(),
    ); 
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // ChangeNotifierProvider(create: (_) => RamuanProvider()),
        // ChangeNotifierProvider(create: (_) => HistoryRamProvider()),
        ChangeNotifierProvider(create: (_) => FavoritProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),

      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HerbAI',
          theme: Styles.themeData(
            isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const RootScreen(),

          routes: {
          RootScreen.routeName: (context) => const RootScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
        },
        );
      },
      ),
    );
  }
}



