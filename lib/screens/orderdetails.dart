import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodordering_app/screens/cart_page.dart';
import 'package:foodordering_app/screens/checkout.dart';
import 'package:foodordering_app/screens/login_screen.dart';
import 'package:foodordering_app/screens/welcome_screen.dart';
import 'package:foodordering_app/screens/widgets/text_form.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order extends StatefulWidget {

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  late UserCredential userCredential;
  TextEditingController FullName = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController PhoneNo = TextEditingController();
  TextEditingController AdditionalInfo = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool loading=false;

  /*void submit() async {
    setState(() {
      loading = true;
    });
    await FirebaseFirestore.instance
        .collection("UserDetails")
        .doc(userCredential.user?.uid)
        .set({
        "FullName": FullName.text.trim(),
        "Address": Address.text.trim(),
        "PhoneNo": PhoneNo.text.trim(),
        "userid2": userCredential.user?.uid,
        "AdditionaInfo": AdditionalInfo.text.trim(),
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Cart(),
      ),
    );
    setState(() {
      loading = false;
    });
  }
*/
void validation() {
    if (Address.text.trim().isEmpty ||
        Address.text.trim() == null && PhoneNo.text.trim().isEmpty ||
        PhoneNo.text.trim() == null) {
      
      ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar(
          content: Text("All Field is Empty"),
        ),
      );
    }
    if (Address.text.trim().isEmpty || Address.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar(
          content: Text("Address is Empty"),
        ),
      );
      return;
    } 
    if (PhoneNo.text.trim().isEmpty || PhoneNo.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar
      (
        SnackBar(
          content: Text("Phone Number is Empty"),
        ),
      );
      return;
    } else {
      //submit();
      Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => 
                              Cart(),),);
  
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
              Text("Delivery Information",style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
              
              Container(
                height:300,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                  MyTextField(hintText: "Full Name", obscureText: false , controller: FullName),
                  MyTextField(hintText: "Address", obscureText: false , controller: Address),
                  MyTextField(hintText: "Phone Number", obscureText: false, controller: PhoneNo),
                  MyTextField(hintText: "Additional Information", obscureText: false, controller: AdditionalInfo),
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
                              CartPage(),),);
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
                              Cart(),),);*/
                         },
                         child: Text("Submit",style:TextStyle(color: Colors.white,),),
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
