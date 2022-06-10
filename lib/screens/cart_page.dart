import 'package:flutter/material.dart';
import 'package:foodordering_app/provider/my_provider.dart';

import 'package:provider/provider.dart';

import 'checkout.dart';
import 'home_screen.dart';
import 'orderdetails.dart';

class CartPage extends StatelessWidget {
  @override
  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }) {
    return Row(
      children: [
        Container(
          width: 170,
          height: 170,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Enjoy your meal",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                  Text(
                    "\Rs. $price",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "$quantity",
                        style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                      )
                    ],
                  )
                ],
              ),
            ),
               IconButton(
                  icon: const Icon(Icons.close, color: Colors.deepOrange), onPressed: () {   
                  },
                ),
          ],

        )),
      ],
    );
  }
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalprice();
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
                      return Order();
                       },),);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 65,
          decoration: BoxDecoration(
              color: Color(0xff3a3e3e), borderRadius: BorderRadius.circular(10)),
           
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\Rs. $total",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "Check Out",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getDeleteIndex(index);
          return GestureDetector(
            onTap: (){
              provider.delete();
            }
            ,
            child: cartItem(
              image: provider.cartList[index].image,
              name: provider.cartList[index].name,
              price: provider.cartList[index].price,
              quantity: provider.cartList[index].quantity,
            ),
          );
        },
      ),
    );
  }
}