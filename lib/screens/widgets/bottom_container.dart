import 'package:flutter/material.dart';
class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  BottomContainer({required this.image, required this.price, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 270,
             width: 220,
             decoration: BoxDecoration(
                 color: Color.fromARGB(255, 255, 115, 1),
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CircleAvatar(
                     radius: 55,
                     backgroundImage: NetworkImage(image),
         
                   ),
                   ListTile(leading: Text(name,style: TextStyle(fontSize:16,color: Colors.white ),),
                   trailing: Text('Rs. $price',
                    style: TextStyle(fontSize: 16, color: Colors.white,),),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left:12),
                     child: Row(
                       children: [
                         Icon(Icons.star,size: 20,color: Colors.white,),
                         Icon(Icons.star,size: 20,color: Colors.white,),
                         Icon(Icons.star,size: 20,color: Colors.white,),
                         Icon(Icons.star,size: 20,color: Colors.white,),
                         Icon(Icons.star,size: 20,color: Colors.white,),
                       ],
                     ),
                   ),
                   
                 ],
               ),);
  }
}