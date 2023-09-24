// ignore: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:firebase_firestone/firebase_firestone.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  // Sign-up or Sign-in Process
  void _submitAuthForm(
    String email,
    String username,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential? userCredential;
    try {
      if (isLogin) {
        // Sign in
        debugPrint('sign in in auth_screen.dart');
        debugPrint(email);
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        debugPrint(userCredential.toString());
        debugPrint('ERRRRR');
      } else {
        // Sign up
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // Regist other information in firebase
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(
          {
            'username': username,
            'email': email,
          },
        );
      }
    } on PlatformException catch (err) {
      String? message = 'An error occurred, please check your credentials!';
      if (err.message != null) {
        message = err.message;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message!),
        backgroundColor: Theme.of(ctx).colorScheme.error,
      ));
      // .of(context).showBodyScrim(value, opacity)
      // showBottomSheet((context) => null)
    } catch (err) {
      debugPrint(err.toString());
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: const Text('This is a Apple pen'),
        backgroundColor: Theme.of(ctx).colorScheme.error,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // backgroundColor: Theme.of(context).primaryColor,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: AuthForm(_submitAuthForm),
    );
  }
}
