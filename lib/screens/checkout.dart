import 'package:flutter/material.dart';
import 'package:foodordering_app/screens/login_screen.dart';
import 'package:foodordering_app/screens/signup_screen.dart';

import 'home_screen.dart';

class Cart extends StatelessWidget {
  const Cart({ Key? key }) : super(key: key);

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
                  Text("Thanks for Ordering",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepOrange,) ,),
                 Column(
                  children: [
                    Text("Your Order will be delivered in \n\t\t\t\t\t\t\t\t\t\t\t\tnext 60 minutes",
                    style: TextStyle(fontSize: 18,color: Colors.black,) ,),
                  ], 
                 ),
                 Column(
                  children: [
                    Text("Wanna Re-Order food??",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,) ,),
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
                        return HomeScreen();
                       },),);
                    },
                    
                     child: Text("Re-order",style:TextStyle(color: Colors.white,),),
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