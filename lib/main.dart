import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/config/provider_setup.dart';
import 'package:bookstore/config/router/router.dart';
import 'package:bookstore/data/local/local_storage_hive.dart';
import 'package:bookstore/presentation/bloc/cubit.dart';
import 'package:bookstore/presentation/bloc/state.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:bookstore/presentation/widget/scroll_behaviour_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/router.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';
import 'config/background_tasks.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Firebase.initializeApp(
    name: 'bookStore',
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

    // FirebaseFirestore.instance.enablePersistence(
    //   const PersistenceSettings(
    //     synchronizeTabs: true,
    //   ),
    // );
  } else {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    db.settings = const Settings(
      persistenceEnabled: true,
    );

    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
  }

  await LocalStorageHive().init();

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
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        builder: (context, child) => BlocProvider(
          create: (context) => AuthCubit(
            localStorage: LocalStorageHive(),
          ),
          child: Builder(
            builder: (context) {
              return BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSignedOut) {
                    AppRouter()
                        .router
                        .goNamed(AppRoutes.landingPageToLogin.name);
                  }
                },
                child: MaterialApp.router(
                  scrollBehavior: AppScrollBehavior(),
                  title: 'Gudang Buku',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                    scaffoldBackgroundColor: AppColor.background,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: AppColor.background,
                      elevation: .0,
                      iconTheme: IconThemeData(
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  routerDelegate: AppRouter().router.routerDelegate,
                  routeInformationParser:
                      AppRouter().router.routeInformationParser,
                  routeInformationProvider:
                      AppRouter().router.routeInformationProvider,
                  debugShowCheckedModeBanner: false,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
