import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/screen/appointment/appointment.dart';
import 'package:instant_doctor/screen/auth/signup.dart';
import 'package:instant_doctor/screen/home/home.dart';
import 'package:instant_doctor/screen/auth/login.dart';
import 'package:instant_doctor/screen/intro/intro.dart';
import 'package:instant_doctor/screen/Settings/setting_screen.dart';
import 'package:instant_doctor/screen/splash_screen/splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51JvIZ1Ey3DjpASZjPAzcOwqhblOq2hbchp6i56BsjapvhWcooQXqh33XwCrKiULfAe7NKFwKUhn2nqURE7VZcXXf00wMDzp4YN';
  Stripe.merchantIdentifier = 'merchant.flutter.stripe';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
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
        'appointment': (context) => const Appointment(),
        'splash': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
        'setting': (context) => const SettingScreen(),
        'signup': (context) => const SignUpScreen(),
        'home': (context) => const HomeScreen(),
        // 'bookappointment':(context) => const BookAppointment(),
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
