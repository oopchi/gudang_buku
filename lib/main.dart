import 'dart:io';

import 'package:bookstore/ui/views/home_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/core/constants/colors.dart';
import 'package:bookstore/provider_setup.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  VisibilityDetectorController.instance.updateInterval = const Duration(
    milliseconds: 50,
  );

  if (Platform.isAndroid || dotenv.env['MODE'] == 'RELEASE') {
    await initializeDateFormatting();
  }

  if (Platform.isWindows && dotenv.env['MODE'] == 'DEBUG') {
    runApp(
      DevicePreview(
        builder: (context) => const MyApp(),
      ),
    );
  } else {
    runApp(
      const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Book Store',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: CustomColor.background,
        ),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
