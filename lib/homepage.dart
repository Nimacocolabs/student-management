import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Center(child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xff3FD7F9),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/calicut1.jpg"),
                        maxRadius: 30,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Welcome to CCSIT Online"),
                  ],
                ),
              ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff109BF5),
                        Color(0xff787C88)
                      ]),
                ),
                child: Center(child: Text("Video Lessons",style: TextStyle(fontSize: 15,color: Colors.white),)),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff109BF5),
                        Color(0xff787C88)
                      ]),
                ),
                child: Center(child: Text("Study Materials",style: TextStyle(fontSize: 15,color: Colors.white),)),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff109BF5),
                        Color(0xff787C88)
                      ]),
                ),
                child: Center(child: Text("Examination",style: TextStyle(fontSize: 15,color: Colors.white),)),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff109BF5),
                        Color(0xff787C88)
                      ]),
                ),
                child: Center(child: Text("Assignments/Seminars",style: TextStyle(fontSize: 15,color: Colors.white),)),
              ),
            ],
          ),
        )
    );
  }
}
