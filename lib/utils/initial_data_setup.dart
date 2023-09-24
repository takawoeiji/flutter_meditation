import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


// final languageProvider = StateProvider((ref) => '');
// late final Ref _ref;

enum LanguageType {
  jp,
  cn,
  us,
}

final languageProvider = StateProvider<String>((ref) => 'jp');
// final languageProvider = StateProvider((ref) async {
//   // return 'jp';
//   final pref = await SharedPreferences.getInstance();
//   var lang = pref.getString('language');
//   if (lang == '' || lang == null) {
//     pref.setString('language', 'jp');
//   }
//   return lang;
// });
final languageTypeProvider = FutureProvider<LanguageType>((ref) async {
  final pref = await SharedPreferences.getInstance();
  var lang = pref.getString('language');
  if (lang == '' || lang == null) {
    pref.setString('language', 'jp');
  }
  switch (lang) {
    case 'jp':
      return LanguageType.jp;
    case 'cn':
      return LanguageType.cn;
    case 'us':
      return LanguageType.us;
  }
  return LanguageType.jp;
});

// Map<Category> _categories;

class InitialDataSetup {
  // Map<Category> _categories;

  initialize(ref) async {
    await _setLanguage(ref);
  }

  _setLanguage(ref) async {
    final pref = await SharedPreferences.getInstance();
    var lang = pref.getString('language');

    if (lang == '' || lang == null) {
      pref.setString('language', 'ja');
    } else if (lang != ref.read(languageProvider)) {
      ref.read(languageProvider.notifier).state = lang;
    }
  }
}
