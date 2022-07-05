import 'package:flutter/material.dart';
import 'package:studentmanagement/adminpage.dart';
import 'package:studentmanagement/navigationpage.dart';
import 'package:studentmanagement/registerpage.dart';
import 'package:studentmanagement/validate.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var _lkey = new GlobalKey<FormState>();
  TextEditingController usernameinputcontroller = new TextEditingController();
  TextEditingController passwordinputcontroller = new TextEditingController();
  bool visible = true;
  var msg = "Invalid username or password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _lkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Image.asset("assets/images/login.png",height: 200,),
                SizedBox(height: 30,),
                Center(
                    child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold),
                )),
                SizedBox(height: 20,),
                Center(
                    child: Text(
                      "WELCOME ! Login with your Credentials",
                      style: TextStyle(
                          fontSize: 10,fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: usernameinputcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'abc@gmail.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (value) {
                      return Validate.emailValidator(value!);
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: passwordinputcontroller,
                    obscureText: visible,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      // hintText: 'Enter the password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          child: Icon(Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (value) {
                      return Validate.pwdvalidator(value!);
                    },
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: () {
                      if (_lkey.currentState!.validate()) {
                        if (usernameinputcontroller.text == "admin@gmail.com" &&
                            passwordinputcontroller.text == "admin123") {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => Adminpage()));
                        } else if (usernameinputcontroller.text == "user@gmail.com" &&
                            passwordinputcontroller.text == "user1234")
                          {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navigationpage()));
                          }
                        else
                          showsanckbar(context, msg);
                        }
                      },
                      child:Text("LOGIN")),
                SizedBox(
                  height: 40,),
              Text("Does not have a account"),
                SizedBox(
                  height: 20,),
                TextButton(
                    child: Text("REGISTER"),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registerpage()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showsanckbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 15),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    ));
  }
}
