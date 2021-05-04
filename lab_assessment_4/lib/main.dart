/*
Author: Muhammad Abdullahi Nma
Lab Assignment 4
*/

import 'package:flutter/material.dart';

void main() {
  final emailController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  //String email;
  var pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         textTheme: TextTheme(
           bodyText1: TextStyle(),
           bodyText2: TextStyle(),
           ).apply(
             bodyColor: Colors.white,
             displayColor: Colors.white, 
             ),
          ),
      
      home: Scaffold(
        backgroundColor: Colors.black,

        body: SingleChildScrollView(

            //Container to hold everything
            child: Container(
              //padding to give space so the content of the body doesn't touch the edge of the phone
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
            //decoration: BoxDecoration(color: Colors.black),
            child: Column(
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                fontSize: 20,
                  ),
                ),
                SizedBox(height:70),

                Text(
                'WELCOME BACK',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                fontSize: 15,
                letterSpacing: 2.7,
                  ),
                ),
                SizedBox(height:30),

              //Text Field for Email Address
              TextFormField(
                controller: emailController,
                //Style for the text in the email text field
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 19,
                  color: Colors.black,
                ),

                //Designing the input field
                decoration: InputDecoration(
                  //suffixIcon: Icon(Icons.check_circle_rounded),          
                  //Focused Border to remove the default style of the text field when it is clicked on
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    //borderSide: BorderSide(color: Colors.white,),
                  ),
                  hintText: 'Email address',
                ),
                
                //Validator
                // validator: (String value){
                //   if(!regExp.hasMatch(value)){ 
                //     return 'Please enter a valid email';
                //   }
                //},
                
                //onchanged property to handle the email and check if it is a valid email
                onChanged: (String emailValue){
                  if(regExp.hasMatch(emailValue)){ 
                    print('Valid Password');
                  }else{
                    print('Invalid Email');
                  }
                },
                ),
                SizedBox(height:30),

                TextFormField(
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 19,
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      //borderSide: BorderSide(color: Colors.white,),
                    ),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height:40),

                //Constrained Box for the button to increase the height and width of the button
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 500, height: 50,),
                  child: ElevatedButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {

                    },

                    //Style to change the color of the button when it is clicked on
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) return Colors.indigo[800];
                          return Colors.lightBlue[900];
                        },
                      ),
                    ),
                  )
                ),
                SizedBox(height:30),

                GestureDetector(
                  onTap: (){
                    print('Why did you forget your password');
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 17,
                      //color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height:10),

                GestureDetector(
                  onTap: () {
                    print('You cannot reset password in this version');
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
            ],
          ),
          ),
        ),
      ),

    )
  );
}

