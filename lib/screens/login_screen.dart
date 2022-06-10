import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodordering_app/screens/home_screen.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({ Key? key }) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  
  RegExp regExp = new RegExp(p);
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  late UserCredential userCredential;

  void submit() async {
    setState(() {
      loading = true;
    });
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
      );
    } on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
        ),
      );
      setState(() {
        loading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );

      setState(() {
        loading = false;
      });
    }

    setState(() {
      loading = false;
    });
  }

  
  void vaildation() {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Both Fleid Is Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password Is Too Short"),
        ),
      );
    } else {
      submit();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.deepOrange,),onPressed: (){}),

      ) ,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Padding(
             padding: const EdgeInsets.only(right:145,),
             child: Text("Log In",style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),),
           ),
            Column(
              children: [
                TextFormField(
                  controller: email,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined,color: Colors.deepOrange,),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,),
                  ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline,color: Colors.deepOrange,),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.deepOrange,
                    ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,),
                  ),
                  ),
                ),
              ],
            ),
            /*loading?
                  CircularProgressIndicator()
                
              :*/Container(
              height: 45,
              width: 200,
              child: MaterialButton(
                         color: Colors.deepOrange,
                         shape: RoundedRectangleBorder(
                           side: BorderSide(color: Colors.grey,width: 2),
                           borderRadius: BorderRadius.circular(30)
                         ),
                         onPressed: (){
                           vaildation();
                         },
                         child: Text("Log In",style:TextStyle(color: Colors.white,),),
                         ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New user?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Register now.",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ],
            ),
          ],
        ),
      ),

    );
  }
}