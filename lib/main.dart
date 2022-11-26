import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/data/local/local_storage_hive.dart';
import 'package:bookstore/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/provider_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await LocalStorage().init();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAZkVv3VKza3lXpGeYDDsvMijziuzg18oA",
        authDomain: "bookstore-2d8e6.firebaseapp.com",
        projectId: "bookstore-2d8e6",
        storageBucket: "bookstore-2d8e6.appspot.com",
        messagingSenderId: "81401705015",
        appId: "1:81401705015:web:de73d735400c0a373e45b2",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;
  db.settings = const Settings(
    persistenceEnabled: true,
  );

  final User? user = FirebaseAuth.instance.currentUser;

  // VisibilityDetectorController.instance.updateInterval = const Duration(
  //   milliseconds: 50,
  // );

  // if (Platform.isAndroid || dotenv.env['MODE'] == 'RELEASE') {
  //   await initializeDateFormatting();
  // }

  // if (Platform.isWindows && dotenv.env['MODE'] == 'DEBUG') {
  //   runApp(
  //     DevicePreview(
  //       builder: (context) => const MyApp(),
  //     ),
  //   );
  // } else {
  //   runApp(
  //     const MyApp(),
  //   );
  // }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'Book Store',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColor.background,
        ),
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
