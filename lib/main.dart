import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:gather/routing/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402,874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        title: '2gather',
        theme: appTheme
      ),
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}

final appTheme = ThemeData(
  fontFamily: 'Poppins',
  textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(237, 97, 135, 1),
    primary: AppColors.primary2,
  ),
  useMaterial3: true,
);