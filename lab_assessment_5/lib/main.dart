import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sbsc_todo_app/model/todo_model.dart';
import 'package:sbsc_todo_app/theme/colors.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        backgroundColor: customBackgroundColor,
        scaffoldBackgroundColor: customScaffoldBackgroundColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
var currentDate = Jiffy().format('EEE, do');
String deadlineDate;

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  bool checkTodo = false;

  //Keep track of how many TODO we have
  List<TodoModelClass> todos = [];

  void _removeTodoItem(int index) {
    setState(() => todos.removeAt(index));
    // setState((){
    //   todos[index].title.lineThrough;
    // });
  }

  void _showInputFieldWidget(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        children: [
          Container(
            //height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 1.5,
            child: Row(
              children: <Widget>[
                Text(
                  "Create TODO",
                  style: GoogleFonts.lateef(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    ),
                  ),

                Spacer(),


                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ), 
                    onPressed: (){
                      Navigator.pop(context);
                    }
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                hintText: "Add a title",
                hintStyle: GoogleFonts.lateef(
                  color: Colors.grey,
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(height: 24),
          Text(
            'Pick a deadline',
            style: GoogleFonts.lateef(
              color: Colors.grey,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            )
          ),

          Container(
            height: 100,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                //deadlineDate = newDateTime.toString();
                deadlineDate = Jiffy(newDateTime).format('EEE, do BY HH:mm');
              },
              use24hFormat: false,
              minuteInterval: 1,
            ),
          ),

          const SizedBox(height: 24),
          TextFormField(
            controller: descController,
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Add a description",
                hintStyle: GoogleFonts.lateef(
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    //borderSide: BorderSide(color: Colors.white,),
                ),
              ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty) {
                  setState(() {
                    todos.add(TodoModelClass(
                      title: titleController.text,
                      description: descController.text,
                      dateTime: DateTime.now(),
                    ));
                  });
                }
                Navigator.pop(context);
              },
              child: Text(
                "FINISH",
                style: GoogleFonts.lateef(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              )
            ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Media query helps us get the device SIZE (height, width) property
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('My Todos'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            
            Container(
              height: size.height / 4,
              color: Colors.white,
              //Stack widget stacks widgets on top of each other
              child: Stack(
                children: [
                  // first child of the stack
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1508558936510-0af1e3cccbab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80"),
                      ),
                    ),
                  ),
                  // second child
                  // Positioned(
                  //   bottom: 10,
                  //   right: 4,
                  //   child:
                  // ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Don't stop when you are tired.\nStop when you are DONE!",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.lateef(
                        color: Colors.white,
                        height: .8,
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome back, Muhammad',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            
            //Todo list will appear here
            Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0),
              child: Text(
                'ONGOING',
                style: GoogleFonts.lateef(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                                    ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: new Text('Mark "${todos[index].title}" as completed?'),
                            actions: <Widget>[
                              FlatButton(
                                child: new Text('CANCEL'),
                                // The alert is actually part of the navigation stack, so to close it, we
                                // need to pop it.
                                onPressed: () => Navigator.of(context).pop()
                              ),
                              FlatButton(
                                child: new Text('MARK AS COMPLETED'),
                                onPressed: () {
                                  _removeTodoItem(index);
                                  Navigator.of(context).pop();
                                }
                              )
                            ]
                          );
                        }
                      );
                    },
                    onDoubleTap: () {
                      // This Will be Called When User Click On ListView Item
                      showDialogFunc(context, todos[index].title, todos[index].description,);
                    },
              
                    //Add a title 
                    child: Card(
                      //elevation: 4,
                      shadowColor: Colors.white,
                      child: SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                                      child: Column(
                                        children: <Widget>[
                                          //ADD AN ICON HERE INSTEAD
                                          Icon(
                                            Icons.trip_origin,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                  // Checkbox(
                                  //   value: false, 
                                  //   ),
                                  Text(
                                    todos[index].title,
                                    style: GoogleFonts.lateef(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Spacer(),
                                  //??????SECTION TO ADD DAY OF THE WEEK
                                  Text(
                                    //currentDate,
                                    currentDate,
                                    style: GoogleFonts.lateef(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ), 
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Container(
            //   margin: EdgeInsets.all(5.0),
            //   padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0),
            //   child: Text(
            //     'COMPLETED',
            //     style: GoogleFonts.lateef(
            //       color: Colors.white,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600,
            //                         ),
            //     ),
            //     decoration: BoxDecoration(
            //       color: Colors.grey[400],
            //       shape: BoxShape.rectangle,
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            // ),

            // Expanded(
            //   child: Container(),
            // ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onPressed: () {
          // clear the controller value as soon as you tap on the FAB
          titleController.clear();
          descController.clear();
          _showInputFieldWidget(context);
        },
        tooltip: 'Add Todo',
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}

// Block method for ShowDialog | When you double click on the todo
showDialogFunc(context, titleController, descController) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.width * 1.5,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ), 
                    onPressed: (){
                      Navigator.pop(context);
                    }
                  ),
                ),
                
                Text(
                  titleController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),

                SizedBox(height: 10.0),

                RichText(
                  text: TextSpan(
                    text: 'Date Created: ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      //fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${currentDate}\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(
                        text: 'Deadline Date: ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(
                        text: '${deadlineDate}\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
                
                SizedBox(
                  height: 30,
                ),

                Row(
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Spacer(),

                    Text(
                      'to be completed',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  padding: EdgeInsets.all(14.0),
                  //height: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    //boxShadow: BoxShadow[12,10],
                  ),
                  child: Text(
                    descController,
                    style: TextStyle(
                      fontSize: 15, 
                      color: Colors.black,
                    ),
                  ),
                ),

                Spacer(),
                
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "SAVE",
                      style: GoogleFonts.lateef(
                        //backgroundColor: Colors.black,
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    },
  );
}
