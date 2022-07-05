import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studentmanagement/validate.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';


class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  var _pkey=new GlobalKey<FormState>();
  TextEditingController fullnameinputcontroller=new TextEditingController();
  var gender;
  TextEditingController addressinputcontroller=new TextEditingController();
  TextEditingController mobileinputcontroller = new TextEditingController();
  String? course;
  bool visible=true;
  TextEditingController dateinputcontroller=new TextEditingController(
      text: DateTime.now().toString());
  var dob;
  var _valueToValidate3;
  XFile ? _image;
  final ImagePicker _picker = ImagePicker();

  get validate => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
        child: Form(
          key:_pkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Center(child: Text("Profile Page",style: TextStyle(fontSize: 30),)),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    controller:fullnameinputcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Fullname',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (value){
                      return Validate.txtvalidator(value!);
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    controller:addressinputcontroller,
                    maxLines: 4,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (value){
                      return Validate.txtvalidator(value!);
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
                  child: Row(
                    children: [Expanded(
                      child: CountryCodePicker(
                        initialSelection: 'IN',
                        showCountryOnly: true,
                        favorite: ['+91','IN'],
                        enabled: true,
                        alignLeft: true,
                      ),
                    ),
                      Expanded(
                        child: TextFormField(
                          controller: mobileinputcontroller,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(labelText: "MOBILE NUMBER",
                            // focusedBorder: OutlineInputBorder(
                            //   borderRadius:
                            //   BorderRadius.all(Radius.circular(10)),
                            //   borderSide: BorderSide(
                            //       color: Color(0xff610B56),
                            //       width: 3
                            //   ),
                            // ),
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(30)),
                            // enabledBorder: OutlineInputBorder(
                            // borderRadius:
                            // BorderRadius.all(Radius.circular(20)),
                            //
                            // )
                          ),
                          validator: (value)
                          {
                            return Validate.phvalidator(value!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: DropdownButtonFormField<String>(
                    value: course,
                    decoration: InputDecoration(
                      hintText: "COURSE",
                      prefixIcon: Icon(Icons.email),
                      //suffixIcon: Icon(Icons.panorama_fish_eye),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (ctgry) =>
                        setState(() => course = ctgry),
                    validator: (value) => value == null ? 'field required' : null,
                    items: ['BSC', 'BCA', 'MSC', 'MCA','BTECH','MTECH']
                        .map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    //dateMask: 'yyyy/MM/dd',
                    controller:dateinputcontroller ,
                    //initialValue: _initialValue,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    icon: Icon(Icons.event),
                    dateLabelText: 'DOB',
                    // locale: Locale('pt', 'BR'),
                    onChanged: (val) => setState(() => dob = val),
                    validator: (val) {
                      setState(() => _valueToValidate3 = val ?? '');
                      return null;
                    },
                    // onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: Text("Gender",style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Row(children: [
                  Expanded(
                    child: ListTile(
                      leading: Radio(
                        value: 'Male', groupValue: gender, onChanged: (Object? value) {
                        setState(() {
                          gender=value;
                        });},),
                      title: Text("Male"),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Radio(
                        value: 'Female', groupValue: gender, onChanged: (Object? value) {
                        setState(() {
                          gender=value;
                        });},),
                      title: Text("Female",),
                    ),
                  ),
                ]),
                SizedBox(height: 30,),
                Text("Profile Photo",style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    _showpicker();
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey,
                    child: _image!=null ? Image.file(File(_image!.path),fit: BoxFit.fill,):
                    Container(
                      child: Icon(Icons.image,size:100,),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  if(_pkey.currentState!.validate()){
                  }
                  print("Edit");
                }, child: Text("Edit")),
              ],
            ),
          ),
        ),
      ),);
  }
  _imagefromGallery () async
  {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
    });
  }
  _imagefromComera() async
  {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=photo;
    });
  }
  _showpicker(){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Ink(decoration: ShapeDecoration(
                        color: Colors.pink,
                        shape: CircleBorder (),),
                        child: IconButton(onPressed: (){
                          _imagefromComera();
                        },
                          icon: Icon(Icons.camera_alt_rounded,color: Colors.white),
                          iconSize: 20, splashRadius: 40,),),
                      Text("Camera"),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Column(
                    children: [
                      Ink(decoration: ShapeDecoration(
                        color: Colors.purple,
                        shape: CircleBorder(),),
                        child: IconButton(onPressed: (){
                          _imagefromGallery();
                        },
                          icon: Icon(Icons.photo), color: Colors.white,
                          iconSize: 20,splashRadius: 40,),),
                      Text("Gallery"),
                    ],
                  ),
                ],),
            ),
          );
        }
    );
  }
}
