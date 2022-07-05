import 'package:flutter/material.dart';
import 'package:studentmanagement/contactpage.dart';
import 'package:studentmanagement/loginpage.dart';
import 'package:studentmanagement/profilepage.dart';
import 'package:studentmanagement/registerpage.dart';
import 'package:studentmanagement/viewstudent.dart';

class Adminpage extends StatefulWidget {
  var names = ["Nima", "Gopika", "Amritha", "Ayana", "Mathew",];
  var emails = ["nimakcpy98@gmail.com", "gopuvk@gmail.com", "pamritha12@gmail.com",
    "ayana1629@gmail.com",
    "mathewthomasds@gmail.com",
  ];
  var courses = ["MCA", "MCA", "MCA", "MCA","MCA",];
  var images = [AssetImage("assets/images/nima.jpg"),
    AssetImage("assets/images/gopu.jpg"),
    AssetImage("assets/images/amritha.jpg"),
    AssetImage("assets/images/ayana.jpg"),
    AssetImage("assets/images/mathew.jpg"),];

  @override
  _AdminpageState createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  List titles = [
    "View students",
    "Add students",
    "Add Exams",
    "Add Material",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Loginpage()));
            }, child: Icon(Icons.logout,)),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "WELCOME ADMIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 400,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewStudent(
                                            names: widget.names,
                                            courses: widget.courses,
                                            emails: widget.emails,
                                            images: widget.images)));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Registerpage()));
                              } else if (index == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profilepage()));
                              } else if (index == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Contactpage()));
                              }
                            },
                            child: Container(
                              height: 45,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue),
                              child: Center(child: Text(titles[index])),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
