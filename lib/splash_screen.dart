import 'package:flutter/material.dart';
import 'package:multi_role_app/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashFunction();
  }

  void _splashFunction() async {
    //going to the home screem if user is already logged in else go to login page
    final pf = await SharedPreferences.getInstance();
    bool status = pf.getBool('isLogin') ?? false;

    if (status) {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://images.pexels.com/photos/13012302/pexels-photo-13012302.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
      ),
    );
  }
}
