import 'package:XFoody/providers/likes.dart';
import 'package:XFoody/screens/favourite/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:XFoody/screens/Home/home.dart';
import 'package:XFoody/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Favourites(),
      child: MaterialApp(
          title: 'Flutter Food App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 213, 211, 215)),
            useMaterial3: true,
          ),
          home: SplashScreen()),
    );
  }
}
