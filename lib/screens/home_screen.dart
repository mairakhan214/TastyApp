import 'package:flutter/material.dart';
import 'package:foodordering_app/models/categories_models.dart';
import 'package:foodordering_app/models/food_model.dart';
import 'package:foodordering_app/models/foodcategories_model.dart';
import 'package:foodordering_app/provider/my_provider.dart';
import 'package:foodordering_app/screens/categories_screen.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';
import 'widgets/bottom_container.dart';


 class HomeScreen extends StatefulWidget {
   const HomeScreen({ Key? key }) : super(key: key);
 
   @override
   State<HomeScreen> createState() => _HomeScreenState();
 }
 
 class _HomeScreenState extends State<HomeScreen> {
   List<CategoriesModle> burgerList=[];
   List<CategoriesModle> allList=[];
   List<CategoriesModle> recipeList=[];
   List<CategoriesModle> pizzaList=[];
   List<CategoriesModle> drinkList=[];
   List<FoodModle> singleFoodList=[];

   List<FoodCategoriesModle> burgerCategoriesList=[];
   List<FoodCategoriesModle> recipeCategoriesList=[];
   List<FoodCategoriesModle> drinkCategoriesList=[];
   List<FoodCategoriesModle> pizzaCategoriesList=[];

   Widget categoriesContainer({required String image, required String text}){
      return Column(
        children: [
          Container(
                      margin: EdgeInsets.only(left:20),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                      image:DecorationImage (image: NetworkImage(image),),
                        color: Color.fromARGB(255, 243, 127, 19),
                           borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                 SizedBox(
                   height: 10,
                 ),
                 Text(text,style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 248, 116, 76)),),
                   ],
                 );
    } 

 Widget burger(){
    return Row(
       children: burgerList.map((e) => GestureDetector(
      onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: burgerCategoriesList,
                      ),
                    ),
                  );
       },
         child: categoriesContainer(image: e.image, text: e.name,
         ),
       )).toList(),
       
    );
  }

  Widget all(){
    return Row(
     children: allList.map((e) => categoriesContainer(image: e.image, text: e.name)).toList(),
    );
  }

  Widget recipe(){
    return Row(
     children: recipeList.map((e) => GestureDetector
     ( onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: recipeCategoriesList,
                      ),
                    ),
                  );
       },
       child: categoriesContainer(image: e.image, text: e.name))).toList(),
    );
  }

  Widget pizza(){
    return Row(
     children: pizzaList.map((e) => GestureDetector(
        onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: pizzaCategoriesList,
                      ),
                    ),
                  );
       },
       child: categoriesContainer(image: e.image, text: e.name))).toList(),
    );
  }

  Widget drink(){
    return Row(
     children: drinkList.map((e) => GestureDetector(
        onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: drinkCategoriesList,
                      ),
                    ),
                  );
       },
       child: categoriesContainer(image: e.image, text: e.name))).toList(),
    );
  }

   Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
      provider.getBurgerCategory();
      provider.getAllCategory();
      provider.getRecipeCategory();
      provider.getPizzaCategory();
      provider.getDrinkCategory();
      allList = provider.throwAllList;
      burgerList = provider.throwBurgerList;
      recipeList = provider.throwRecipeList;
      pizzaList = provider.throwPizzaList;
      drinkList = provider.throwDrinkList;
      provider.getFoodList();
      singleFoodList = provider.throwFoodModleList;
      provider.getBurgerCategoriesList();
      burgerCategoriesList = provider.throwBurgerCategoriesList;
       provider.getPizzaCategoriesList();
      pizzaCategoriesList = provider.throwPizzaCategoriesList;
       provider.getrecipeCategoriesList();
      recipeCategoriesList = provider.throwRecipeCategoriesList;
       provider.getDrinkCategoriesList();
      drinkCategoriesList = provider.throwDrinkCategoriesList;


     return Scaffold(
       drawer: Drawer(
         child: Container(
           child: SafeArea(child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               UserAccountsDrawerHeader(accountName: Text("Maira Salman"),
                accountEmail: Text("mairasalman003@gmail.com"),
                decoration: BoxDecoration(
                   image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.jpg"),),),
                  currentAccountPicture: (
                    CircleAvatar(
                      backgroundImage: AssetImage("images/profile.jpg"),
                    )
                  ),
                ),
                
                 drawerItem(icon: Icons.person,name: 'Profile'),
                 drawerItem(icon: Icons.add_shopping_cart,name: 'Cart'),
                 drawerItem(icon: Icons.shop,name: 'Order'),
                 drawerItem(icon: Icons.error,name: 'About'),

                 Divider(
                   thickness: 2,
                   color: Color(0xff2b2b2b),

                 ),
                 ListTile(
                   leading:Text("Communicate",style: TextStyle(color: Color(0xff2b2b2b),fontSize: 20),), 
                 ),
                 drawerItem(icon: Icons.lock,name: 'Change'),
                 drawerItem(icon: Icons.exit_to_app,name: 'LogOut'),
             ],
           ),),
         ),
       ),
       appBar:AppBar(
        //backgroundColor: Colors.white,
       // leading: IconButton(icon:Icon(Icons.sort,color: Colors.deepOrange,),onPressed: (){}),
        elevation: 0.0 ,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
          ),
        ],
     
     ),

     body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: TextField(
               decoration: InputDecoration(
                 hintText: "Search Food",
                 hintStyle: TextStyle(color: Colors.white,),
                 prefixIcon: Icon(Icons.search_outlined,color: Colors.white,),
                 filled: true,
                 fillColor: Color.fromARGB(255, 255, 115, 1),
                 border: OutlineInputBorder(
                   borderSide: BorderSide.none,
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
             ),
           ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: [
                 all(),
                 burger(),
                 pizza(),
                 recipe(),
                 drink(),
                 
               ],
               
             ),
           ),
         
          Container(
             margin: EdgeInsets.symmetric(horizontal:10 ),
             height:480 ,
             child: GridView.count(crossAxisCount: 2,
             shrinkWrap: false,
             primary: false,
             childAspectRatio: 0.8,
             crossAxisSpacing:20,
             mainAxisSpacing: 20,

             children: singleFoodList.map((e) => GestureDetector(
               onTap: (){
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
               child: BottomContainer(
                 name: e.name,
                price: e.price,
                image: e.image),
             ),).toList(),
             /*children: [
               bottomContainer(name: "Cheese pizza", price: "\n Rs.850", image: 'images/2.png'),
               bottomContainer(name: "Fajita pizza", price: "\n Rs.1000", image: 'images/4.png'),
               bottomContainer(name: "Tikka pizza", price: "\n Rs.900", image: 'images/5.png'),
               bottomContainer(name: "Afghani pizza", price: "\n Rs.950", image: 'images/3.png'),
               bottomContainer(name: "Cheese pizza", price: "\n Rs.850", image: 'images/2.png'),
               bottomContainer(name: "Fajita pizza", price: "\n Rs.1000", image: 'images/4.png'),
               bottomContainer(name: "Tikka pizza", price: "\n Rs.900", image: 'images/5.png'),
               bottomContainer(name: "Afghani pizza", price: "\n Rs.950", image: 'images/3.png'),
             ],*/
   ),
           ),
           
        ],
      ),
     );
   }}
  

  drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xff2b2b2b)
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 18, color: Color(0xff2b2b2b),
      ),
    ));
  }

/*class bottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const bottomContainer({
    Key? key,
    required String this.name,required this.price,required String this.image
  }) : super(key: key);
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
                     backgroundImage: AssetImage(image),
         
                   ),
                   ListTile(leading: Text(name,style: TextStyle(fontSize:16,color: Colors.white ),),
                   trailing: Text(price
                     ,style: TextStyle(fontSize: 16, color: Colors.white,),),
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
               ),
           );
  }*/

