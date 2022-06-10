import 'package:flutter/material.dart';
import 'package:foodordering_app/screens/login_screen.dart';
import 'package:foodordering_app/screens/signup_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset(
                  "images/logo.jpg") ,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                children: [
                  Text("Welcome To Tasty",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepOrange,) ,),
                 Column(
                  children: [
                    Text("Order food from our resturant and ",),
                     Text("Make reservation in real time ",),
                  ], 
                 ),
                 Container(
                   width: 300 ,
                   height: 40,
                   child: MaterialButton(
                     color: Colors.deepOrange,
                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.white24,width: 2),
                       borderRadius: BorderRadius.circular(30)
                     ),
                     onPressed: () { 
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
                        return LogInPage();
                       },),);
                    },
                    
                     /*onPressed: (){
                       Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => 
                              LogInPage(),),);
                     },*/
                     child: Text("Log In",style:TextStyle(color: Colors.white,),),
                     ),
                 ),
                 Container(
                   width: 300 ,
                   height: 45,
                   child: MaterialButton(
                     color: Colors.white,
                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.deepOrange,width: 2),
                       borderRadius: BorderRadius.circular(30)
                     ),
                     onPressed: () { 
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
                        return SignUpPage();
                       },),);
                    },
                    
                     /*onPressed: (){
                       Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (context) => 
                              SignUpPage(),),);
                     },*/
                     child: Text("Sign Up",style:TextStyle(color: Colors.deepOrange,),),
                     ),
                 ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}