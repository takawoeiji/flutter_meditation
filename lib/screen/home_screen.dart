import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_galally/screen/auth_screen.dart';
import 'package:image_galally/screen/category_screen.dart';
import 'package:image_galally/screen/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/initial_data_setup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // InitialDataSetup().initialize(ref);
            if (snapshot.connectionState == ConnectionState.waiting) {
              // スプラッシュ画面などに書き換えても良い
              return const SplashScreen();
            }
            if (snapshot.hasData) {
              // User が null でなない、つまりサインイン済みのホーム画面へ
              return const CategoryScreen();
            }
            // User が null である、つまり未サインインのサインイン画面へ
            return const AuthScreen();
          },
        ),
      );
}
