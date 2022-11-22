import 'package:bookstore/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/src/constants/colors.dart';
import 'package:bookstore/provider_setup.dart';
import 'package:visibility_detector/visibility_detector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  await dotenv.load();

  VisibilityDetectorController.instance.updateInterval = const Duration(
    milliseconds: 50,
  );

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
          scaffoldBackgroundColor: CustomColor.background,
        ),
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
