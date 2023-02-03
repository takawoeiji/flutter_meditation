import 'package:flutter_riverpod/flutter_riverpod.dart';

final constantsProvider = Provider((ref) => Constants());

class Constants {
  String abc = 'his is Title';
}
