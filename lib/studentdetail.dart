
import 'package:flutter/material.dart';
import 'package:studentmanagement/profilepage.dart';

class Studentdetail extends StatefulWidget {
  var names;
  var emails;
  var courses;
  var images;

  Studentdetail({this.names, this.emails, this.courses, this.images});

  @override
  _StudentdetailState createState() => _StudentdetailState();
}

class _StudentdetailState extends State<Studentdetail> {
  get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Student Details")),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,),
             Center(
               child: Container(
                 height: 300,
                 width: 250,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20.0),
                   border: Border.all( color: Colors.black, width: 4),
                   color: Colors.blue,),
                    child: Column(
                      children: [
                      SizedBox(height: 40,),
                        CircleAvatar(backgroundImage: widget.images,maxRadius: 35,) ,
                        SizedBox(height: 40,),
                       Text(widget.names,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                        SizedBox(height: 40,),
                        Text(widget.emails,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                        SizedBox(height: 40,),
                        Text(widget.courses,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                      ],
                    ),
                  ),
             ),
            SizedBox(
              height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilepage()));
            }, child: Text("Edit"))
          ],
        ),
      ),
    );
  }
}
