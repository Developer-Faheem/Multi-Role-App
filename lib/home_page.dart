import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = '';
  String age = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    //we will be loading the shared preference data from the persistent storage
    SharedPreferences pf = await SharedPreferences.getInstance();

    email = pf.getString('email') ?? '';
    age = pf.getString('age') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Users Data',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [Text('Email : '), Text(email)],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [Text('Age : '), Text(age)],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                final pf = await SharedPreferences.getInstance();
                pf.clear(); //this will clear all the stored data and we will be back to the login screen

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(child: Text('SignOut')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
