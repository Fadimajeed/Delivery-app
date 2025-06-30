import 'package:delivery/Extras/current_location.dart';
import 'package:delivery/Extras/description_box.dart';
import 'package:delivery/Extras/drawer.dart';
import 'package:delivery/Extras/food_tile.dart';
import 'package:delivery/Extras/tab_bar.dart';
import 'package:delivery/Pages/food_page.dart';
import 'package:delivery/model/food.dart';
import 'package:delivery/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:delivery/Extras/sliver_app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tap controller
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullmenu) {
    return fullmenu.where((food) => food.category == category).toList();
  }

  // return a list of food items that belong to a specific category
  List<Widget> getFoodInThisCategory(List<Food> fullmenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenue = _filterMenuByCategory(category, fullmenu);
      return ListView.builder(
        itemCount: categoryMenue.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food item
          final food = categoryMenue[index];

          // return food tile UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodPage(food: food)),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            childv: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //current location
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // current location
                MyCurrentLocation(),
                // des box
                MyDescriptionBox(),
              ],
            ),
            titlev: MyTabBar(tabController: _tabController),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            return TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            );
          },
        ),
      ),
    );
  }
}
