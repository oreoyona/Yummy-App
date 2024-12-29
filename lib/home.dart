import "package:flutter/material.dart";
import "package:starter/category_card.dart";
import "package:starter/constants.dart";
import "package:starter/models/food_category.dart";
import "package:starter/models/post.dart";
import "package:starter/models/restaurant.dart";
import "package:starter/restaurant_landscape_card.dart";
import "package:starter/shared_widgets.dart";

import "post_card.dart";

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeThemeMode,
    required this.changeColor,
    required this.colorSelected,
  });

  final void Function() changeThemeMode;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appBarDestinations = [
    NavigationDestination(
      icon: Icon(Icons.credit_card_outlined),
      label: "Category",
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
        icon: Icon(Icons.credit_card_outlined),
        label: "Post",
        selectedIcon: Icon(Icons.credit_card)),
    NavigationDestination(
        icon: Icon(Icons.credit_card_outlined),
        label: "Restaurant",
        selectedIcon: Icon(Icons.credit_card)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 4.0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          actions: [
            ThemeButton(changeThemeMode: widget.changeThemeMode),
            ChangeColorButton(
              changeColor: widget.changeColor,
              colorSelected: widget.colorSelected,
            ),
          ]),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: tab,
          onDestinationSelected: (index) {
            setState(() {
              tab = index;
            });
          },
          destinations: appBarDestinations),
    );
  }

  final pages = [
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: CategoryCard(category: categories[0]),
      ),
    ),
    Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PostCard(post: posts[0]),
      ),
    ),
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: RestaurantLandscapeCard(
          restaurant: restaurants[0],
        ),
      ),
    )
  ];
}
