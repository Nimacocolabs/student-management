import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contactpage extends StatefulWidget {
  const Contactpage({Key? key}) : super(key: key);

  @override
  _ContactpageState createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/contact.jpg"),fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(child: Text("Contact Us",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              SizedBox(height: 30,),
               ListTile(
                  leading: Icon(Icons.call),
                  title: Text('Phone',style: TextStyle(fontSize: 20),),
                  subtitle: Text('8078126095'),
                ),
              SizedBox(height: 30,),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email',style: TextStyle(fontSize: 20),),
                subtitle: Text('nimakcpy98@gmail.com'),
              ),
              SizedBox(height: 30,),
              ListTile(
                leading: Icon(FontAwesomeIcons.whatsapp),
                title: Text('Whatsapp',style: TextStyle(fontSize: 20),),
                subtitle: Text('8078126095'),
              ),
              ],

          ),
        ),
    );
  }
}
