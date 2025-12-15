import 'package:flutter/material.dart';

import 'package:flutter_exercises_tonghopbt/exercises/bai1_login_form/login_screen.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai2_register_form/register_screen.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai3_dem_so/mycount.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai4_count_down_timer/mycountdown.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai5_doi_mau/myPlace.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai6_api_tin_tuc/myhome.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai7_product/my_product.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai9_danh_gia/feedback_screen.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai10_tinh_BMI/bmi_screen.dart';

// Bài 8
import 'package:flutter_exercises_tonghopbt/exercises/bai8_login_and_profile/screens/login_screen.dart'
    as Ex8Login;
import 'package:flutter_exercises_tonghopbt/exercises/bai8_login_and_profile/screens/profile_screen.dart'
    as Ex8Profile;

// Bài 11
import 'package:flutter_exercises_tonghopbt/exercises/bai11_classroom/classroom.dart';

import 'constants/route_names.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bài tập Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),

      initialRoute: RouteNames.home,

      routes: {
        RouteNames.home: (context) => const HomeScreen(),

        RouteNames.exercise1: (context) => const LoginScreen(),
        RouteNames.exercise2: (context) => const RegisterScreen(),
        RouteNames.exercise3: (context) => const mycount(),
        RouteNames.exercise4: (context) => const mycountdown(),
        RouteNames.exercise5: (context) => const MyPlace(),

        // ❌ bỏ const
        RouteNames.exercise6: (context) => MyHome(),
        RouteNames.exercise7: (context) => MyProduct(),
        RouteNames.exercise9: (context) => FeedbackScreen(),
        RouteNames.exercise10: (context) => BMIScreen(),

        RouteNames.exercise8_login: (context) => const Ex8Login.LoginScreen(),
        RouteNames.exercise8_login_profile: (context) =>
            const Ex8Profile.ProfileScreen(),

        RouteNames.exercise11: (context) => const ClassroomScreen(),
      },
    );
  }
}
