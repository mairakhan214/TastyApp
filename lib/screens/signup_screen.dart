import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodordering_app/screens/login_screen.dart';
import 'package:foodordering_app/screens/welcome_screen.dart';
import 'package:foodordering_app/screens/widgets/text_form.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late UserCredential userCredential;
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool loading=false;

  void submit() async {
    setState(() {
      loading = true;
    });
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(userCredential.user?.uid)
        .set({
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "email": email.text.trim(),
        "userid": userCredential.user?.uid,
        "password": password.text.trim(),
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => LogInPage(),
      ),
    );
    setState(() {
      loading = false;
    });
  }

void validation() {
    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
      
      ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar(
          content: Text("All Field is Empty"),
        ),
      );
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar(
          content: Text("Email is Empty"),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar(
          content: Text(
            "Please enter vaild Email",
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar(
          content: Text("Password is Empty"),
        ),
      );
      return;
    } else {
      submit();
  
    } 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
       backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.deepOrange,),
        onPressed: (){}),

      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign Up",style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),),
              
              Container(
                height:300,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                  MyTextField(hintText: "First Name", obscureText: false , controller: firstName),
                  MyTextField(hintText: "Last Name", obscureText: false , controller: lastName),
                  MyTextField(hintText: "E-mail", obscureText: false, controller: email),
                  MyTextField(hintText: "Password", obscureText: true, controller: password),
                  ],
                ),
              ),
             loading?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ):
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
              height: 45,
              width: 120,
              child: MaterialButton(
                         color: Colors.grey,
                         shape: RoundedRectangleBorder(
                           side: BorderSide(color: Colors.white,width: 2),
                           borderRadius: BorderRadius.circular(30)
                         ),
                         onPressed: (){
                           Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => 
                              WelcomePage(),),);
                         },
                         child: Text("Cancel",style:TextStyle(color: Colors.black,),),
                         ),
            ),
            SizedBox(width: 20,),
            Container(
              height: 45,
              width: 120,
              child: MaterialButton(
                         color: Colors.deepOrange,
                         shape: RoundedRectangleBorder(
                           side: BorderSide(color: Colors.white,width: 2),
                           borderRadius: BorderRadius.circular(30)
                         ),
                         onPressed: (){validation();
                         /*Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => 
                              LogInPage(),),);*/
                         },
                         child: Text("Sign Up",style:TextStyle(color: Colors.white,),),
                         ),
            ),
                ],
              ),
            ],
          ),
        ),
      ),
      );
   }
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  