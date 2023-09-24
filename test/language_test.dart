import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageProvider = StateProvider<String>((ref) => 'jp');
void main() {
  // InitialDataSetup().  initialize();
  final container = ProviderContainer();
  container.read(languageProvider.notifier).state = 'us';
  expect(container.read(languageProvider), 'us');
}
