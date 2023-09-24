/*
 * Navigation drawer menu in the appBar
 */
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildHeader(context),
                _buildMenuItems(context),
              ]),
        ),
      );

  // Drawer Header
  Widget _buildHeader(BuildContext context) => Material(
        color: Colors.blue.shade700,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  // backgroundImage: NetworkImage('url'),
                ),
                SizedBox(height: 12),
                Text(
                  'Takawo',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );

  // Drawer menu items
  Widget _buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_max),
              title: const Text('戻る'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pop();
                // FirebaseAuth.instance.signOut();
              },
            ),
            ListTile(
              leading: const Icon(Icons.home_max),
              title: const Text('Homw'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.home_max),
              title: const Text('Homw'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.home_max),
              title: const Text('Homw'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(AppLocalizations.of(context)!.logout),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                // FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      );
}
