class Validate{
 static String? txtvalidator(String value)
  {
    if(value.length<3)
      return 'invalid';
    else {
      return null;
    }
  }
 static String? pwdvalidator(String value)
  {
    if(value.length<8)
      return 'Password should contains atleast 8 characters';
    else {
      return null;
    }
  }
 static String? phvalidator(String value)
  {
    if(value.length!=10 || num.parse(value)==null )
      return 'Phone number should contains atleast 10 characters';
    else {
      return null;
    }
  }
 static String? emailValidator(String value) //Email Validation
 {
   var pattern =
       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
   RegExp regex = new RegExp(pattern);
   if (!regex.hasMatch(value))
   {
     return 'Email format is invalid';
   }
   else
   {
     return null;
   }
 }
}