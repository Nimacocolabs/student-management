import 'package:flutter/material.dart';
import 'package:studentmanagement/contactpage.dart';
import 'package:studentmanagement/homepage.dart';
import 'package:studentmanagement/loginpage.dart';
import 'package:studentmanagement/profilepage.dart';


class Navigationpage extends StatefulWidget {
  const Navigationpage({Key? key}) : super(key: key);

  @override
  _NavigationpageState createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  int _selectedIndex=0;
  List <Widget>_widgetOption=
  [
    Homepage(),
    Profilepage(),
    Contactpage(),
  ];
  List<String> appBarTitle=[
    "Home Page",
    "Profile Page",
    "Contact Us",
  ];
  void _onTappedItem(int index){
   setState(() {
     _selectedIndex=index;
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(appBarTitle[_selectedIndex]),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginpage()));
              },
              child: Icon(Icons.logout)),
        )],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child:Image.asset("assets/images/login.png",height: 200,),),
            ListTile(
              onTap: (){
                _onTappedItem(0);
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              onTap: (){
                _onTappedItem(1);
                Navigator.pop(context);
              },
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              onTap: (){
                _onTappedItem(2);
                Navigator.pop(context);
              },
              leading: Icon(Icons.email_sharp),
              title: Text("Contact Us"),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginpage()));
              },
              leading: Icon(Icons.logout),
              title: Text("logout"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap:_onTappedItem,
        currentIndex:_selectedIndex,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person)),
          BottomNavigationBarItem(
              label: "Contact",
              icon: Icon(Icons.email_sharp)),
        ],
      ),
      body: _widgetOption.elementAt(_selectedIndex));

  }
}
class Policypage extends StatefulWidget {
  const Policypage({Key? key}) : super(key: key);

  @override
  _PolicypageState createState() => _PolicypageState();
}

class _PolicypageState extends State<Policypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(child: Text("This is your policy page")),
    );
  }
}

