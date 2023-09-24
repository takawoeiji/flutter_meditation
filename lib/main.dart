import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_galally/models/user_model.dart';
import 'package:image_galally/screen/auth_screen.dart';
// import 'package:image_galally/model/category_data_old.dart';
import 'package:image_galally/screen/category_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_galally/screen/home_screen.dart';
import 'package:image_galally/utils/initial_data_setup.dart';
import 'controllers/category_list_controller.dart';
import 'firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_galally/check_online.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  // Initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // runApp(const MyApp());
  // riverpod を使うための設定（お呪い）
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // 多言語化のの初期化
        localizationsDelegates: AppLocalizations.localizationsDelegates, // 追加
        supportedLocales: AppLocalizations.supportedLocales, // 追加
        // テーマをシステムのとおりに表示する（ダークかライトか）
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        // 全体で背景色を設定する
        // theme: ThemeData(
        //   // brightness: Brightness.dark,
        //   primaryColor: Colors.deepPurple.shade800.withOpacity(0.8),
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: Colors.deepPurple.shade800.withOpacity(0.8),
        //   ),
        //   scaffoldBackgroundColor: Colors.deepPurple.shade200.withOpacity(0.8),
        // ),
        home: const NextPage());
    // home: const HomeScreen());
  }
}

class NextPage extends ConsumerWidget {
  const NextPage({super.key});
  // CategoryDataDao _categoryDataDao = CategoryDataDao();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer? timer;
    InitialDataSetup().initialize(ref);
    // Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const HomeScreen(),
    // InitialDataSetup().initialize(ref);
    // var init = InitialDataSetup().initialize(ref);
    // init.initialize(ref);
    // print(ref.watch(languageProvider));
    // init.initialize(ref);
    // print(ref.watch(languageProvider));
    // init.initialize(ref);
    // print(ref.watch(languageProvider));
    // final authProvider = ref.watch(authRepositoryProvider);
    // final medProvide = ref.watch(meditationRepositoryProvider);
    // final userProvider = ref.watch(userRepositoryProvider);
    // User user = User(
    // username: 'おためし', email: 'abc@a.com', registrationAt: DateTime.now());
    // ref.read(languageProvider.notifier).state = 'cn';
    // Image.asset('assets/images/category/0.jpg');
    timer = Timer(const Duration(seconds: 5), () {
      print('遷移完了');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(AppLocalizations.of(context)!.title),
      //   // backgroundColor: Colors.blue[100],
      // ),
      // ignore: prefer_const_constructors
      // Image.asset('assets/images/category/0.jpg');
      body: Column(
        children: [
          Image.asset('assets/images/category/0.jpg'),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                // print(ref.watch(languageProvider));
                // final aa = await ref.read(languageProvider);
                // print(aa.toString());
                // print(aa);
                // final categoryRepo = ref.read(categoryListControllerProvider);

                // categoryRepo.when(
                //   loading: () => CircularProgressIndicator(),
                //   data: (categories) {
                //     print(categories[0].title);
                //   },
                //   error: (Object error, StackTrace stackTrace) {},
                // );
                // final cat = CategoryDataDao();
                // User user = authProvider.getCurrentUser();
                // userProvider.createUser(user: user);
                // var ccc = await userProvider.retrieveUsers();
                // var aa = await medProvide.retrieveMeditations();
                // var aaa = categoryRepo
                // final aa = cat.addCategoryListData(category);
                // var bbb = authProvider.getCurrentUser();
                // final users = ref.watch(categoryStreamProvider);
                // print(users.toString());
                // Category category = Category(
                //   category: 'TestData',
                //   desctiption: 'やっほー',
                // );
                // _categoryDataDao.saveCategoryListData(category);
                // Comment out for test Riverpod
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  // builder: (context) => const CategoryScreen()),
                  // MaterialPageRoute(builder: (context) => MplayScreen()),
                );
              },
              child: Text(AppLocalizations.of(context)!.msgEmailError),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // _NextScreenState createState() => _NextScreenState();
  // TODO: implement createState
  // throw UnimplementedError();
}

// class _NextScreenState extends State<NextPage> {
//   Timer? timer;

//   @override
//   void initState() {
//     // InitialDataSetup().initialize(WidgetRef ref);
//     super.initState();
//     print('Start');
//     timer = Timer(
//       const Duration(seconds: 5),
//       () {
//         print('遷移完了');
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => const HomeScreen(),
//         //   ),
//         // );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     //disposeメソッド = タイマーが終わるべき時にタイマーを破棄するメソッド。リソースの解放を担う。
//     timer?.cancel();
//     //cancelメソッド = disposeなどタイマーが破棄されたりdeactive(日活性状態)になった時に呼び出される。
//     //もういいTimerは諦めろ〜って感じでコールバック関数をやめさせる効果を持つ
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     InitialDataSetup().initialize(ref);
//     return const Scaffold(
//       // backgroundColor: AppColors.mainWhite,
//       body: SafeArea(
//         child: Center(
//           child: Text('FirstPage', style: TextStyle(fontSize: 35)),
//         ),
//       ),
//     );
//   }
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Flutter test',
//       // theme: ThemeData(primarySwatch: Colors.blue),
//       // home: AuthScreen(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('おいらのプのリff'),
//           backgroundColor: Colors.red,
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => AuthScreen()));
//               print('Pressed');
//               // AuthScreen();
//             },
//             child: const Text('Press me'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Flutter test',
//       // theme: ThemeData(primarySwatch: Colors.blue),
//       // home: AuthScreen(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('おいらのプのリff'),
//           backgroundColor: Colors.red,
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               print('Pressed');
//               AuthScreen();
//             },
//             child: const Text('Press me'),
//           ),
//         ),
//       ),
//     );
//   }
// }
// }
