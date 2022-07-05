import 'package:flutter/material.dart';
import 'package:studentmanagement/studentdetail.dart';

class ViewStudent extends StatefulWidget {
  var names;
  var emails;
  var courses;
  var images;
 ViewStudent({this.names,this.emails,this.courses,this.images});


  @override
  _ViewStudentState createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Student Detials")),
        ),
     body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.names.length,
                    itemBuilder: (BuildContext context,int index)
                    {
                      return Card(
                        child: ListTile(
                          tileColor: Color(0xffC1600B),
                          isThreeLine: true,
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>Studentdetail(
                              names: widget.names[index],
                                courses: widget.courses[index],
                                emails: widget.emails[index],
                                images: widget.images[index],
                            )));
                          },
                          leading:CircleAvatar(backgroundImage: widget.images[index],maxRadius: 25,) ,
                          title: Text(widget.names[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          subtitle: Column(
                            children: [
                            Text(widget.emails[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                              Text(widget.courses[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            ],

                          ),


                          ),
                      );},),
                ),
            ]

            ),
      ),
    );
  }
}
