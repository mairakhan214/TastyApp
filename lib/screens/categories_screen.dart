import 'package:flutter/material.dart';
import 'package:foodordering_app/models/foodcategories_model.dart';
import 'package:foodordering_app/screens/home_screen.dart';

import 'detail_screen.dart';
import 'widgets/bottom_container.dart';
import 'widgets/item_container.dart';


class Categories extends StatelessWidget {
  List<FoodCategoriesModle> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contet) => HomeScreen()));
          },
        ),
      ),
      
      body: GridView.count(
          shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: list.map((e) => GestureDetector(
                  onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  image: e.image,
                                  name: e.name,
                                  price: e.price,
                                ),
                              ),
                            );
                          },
                  child: ItemContainer(image: e.image, price: e.price, name: e.name))).toList()
                ),
    );
              }            
              }