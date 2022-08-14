import 'package:flutter/material.dart';
import 'package:multi_role_app/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(); //making the controllers
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false, //make the back going arrow
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller:
                  emailController, //providing the controller it will simply store the entered data
              decoration: InputDecoration(
                hintText: 'Enter your Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter your Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: 'Enter your Age',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                final pf = await SharedPreferences.getInstance();

                pf.setString('email', emailController.text.toString());
                pf.setString('age', ageController.text.toString());

                pf.setBool('isLogin', true);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(child: Text('Click')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
