import 'dart:html';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageAccess extends StatefulWidget {
  const StorageAccess({super.key});

  @override
  State<StorageAccess> createState() => _StorageAccessState();
}

class _StorageAccessState extends State<StorageAccess> {
  final storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
