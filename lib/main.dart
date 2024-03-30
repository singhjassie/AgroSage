import 'package:agrosage/screens.dart/notification.dart';
import 'package:flutter/material.dart';


ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 72, 119, 44),
);
ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 72, 119, 44),
  brightness: Brightness.dark,
);
void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          navigationBarTheme: const NavigationBarThemeData().copyWith(
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: kColorScheme.onPrimary.withOpacity(0.7),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary,
            elevation: 4,
          )
        )
      ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: darkColorScheme,
          navigationBarTheme: const NavigationBarThemeData().copyWith(
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: kColorScheme.onPrimary.withOpacity(0.7),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary,
            elevation: 4,
          )
        )
      ),
      home:  NotificationScreen()
    );
  }
}

