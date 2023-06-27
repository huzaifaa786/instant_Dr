import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/screen/auth/signup.dart';
import 'package:instant_doctor/screen/bookappointment/bookappointment.dart';
import 'package:instant_doctor/screen/doctor_list/doctor_list.dart';
import 'package:instant_doctor/screen/home/home.dart';
import 'package:instant_doctor/screen/auth/login.dart';
import 'package:instant_doctor/screen/intro/intro.dart';
import 'package:instant_doctor/screen/Settings/setting_screen.dart';
import 'package:instant_doctor/screen/splash_screen/splash.dart';

void main() async {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  update() {
    setState(() {});
  }

  @override
  void initState() {
    LoadingHelper.onChangeAbsorbClick = update;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: "Klicks",
      initialRoute: 'splash',
      routes: {
        'intro': (context) => const IntroScreen(),
        'splash': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
        'setting': (context) => const SettingScreen(),
        'signup':(context) => const SignUpScreen(),
        'home': (context) => const HomeScreen(),
        'list': (context) => const DoctorList(),
        'bookappointment':(context) => const BookAppointment(),
        // 'home': (context) => const BottomNavScreen(),
        // 'booking_confirm': (context) => const BookingConfirm(),
        // 'order_status': (context) => const OrderStatus(),
        // 'notification': (context) => const NotificationScreen(),
        // 'profile': (context) => const ProfileScreeen(),
        // 'order_histary': (context) => const OrderHistry(),
        // 'edit_profile': (context) => const EditProfile(),
        // 'intro': (context) => const IntroScreen(),
        // 'forgot_screen': (context) => ForgotScreen(),
        // 'Lang': (context) => TranslateScreen(),
      },
    );
  }
}
