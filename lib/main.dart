import 'package:agrosage/agrosage.dart';
import 'package:agrosage/firebase_options.dart';
import 'package:agrosage/screens/splash_screen.dart';
import 'package:agrosage/firebase/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 72, 119, 44),
);
ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 72, 119, 44),
  brightness: Brightness.dark,
);

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
   MultiProvider(
     providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider())],
     child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          navigationBarTheme: const NavigationBarThemeData().copyWith(
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: kColorScheme.onPrimaryContainer.withOpacity(0.7),
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
              color: darkColorScheme.onPrimaryContainer.withOpacity(0.7),
              fontWeight: FontWeight.bold,
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('pa'),
      ],
        //home: ProfileScreen(),
        home: const AgroSage(),
        
      ),
   ),
  );
}