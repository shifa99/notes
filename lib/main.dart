import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_project/core/apis/dio_helper.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/features/manage_notes/presentation/screens/manage_all_notes_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 1039),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: ColorManager.primaryColor),
          primaryColor: ColorManager.primaryColor,
          iconTheme: IconThemeData(
            size: 25.sp,
            color: ColorManager.semiBlackColor,
          ),
          primarySwatch: Colors.blue,
        ),
        home: ManageAllNotesScreen(),
      ),
    );
  }
}
