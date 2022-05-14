import 'package:flutter/material.dart';
import 'package:vigoplace/signup.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical:100, horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Image(
                          image: AssetImage('images/Vigoplace 3.png'),
                        ),
          SizedBox(height: 20,),

          // Image(
          //                 image: AssetImage(''),
          //               ),
            SizedBox(height: 20,),

            Text('Build connections.', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            Text('Build wealth.'),
            SizedBox(height: 30,),
            Text('Vigoplace integrates all of your personal, business and online interaction needs into one simple user friendly application.'),
          SizedBox(height: 50,),
          ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold),
  ),
  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage())),
  child: Text('Login'),
),
SizedBox(height: 20,),
          ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold),
  ),
  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage())),
  child: Text('Sign up', style: TextStyle(color: Colors.purple),),
),

          ],
          ),
        ),
      ),
      
    );
  }
}
