import 'package:flutter/material.dart';
import 'package:powerfm/splash_screen.dart';
import 'package:provider/provider.dart';

// Import your providers here
import 'services/event_service.dart';
import 'services/media_service.dart';
import 'services/posts_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => MediaProvider()),
      ],
      child: MaterialApp(
        title: 'PowerFm',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'Gotham',
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
