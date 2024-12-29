import "package:flutter/material.dart";
import "package:starter/constants.dart";
import "package:starter/shared_widgets.dart";

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
    NavigationDestination(icon: Icon(Icons.credit_card_outlined), label: "Category", selectedIcon: Icon(Icons.credit_card),),
    NavigationDestination(icon: Icon(Icons.credit_card_outlined), label: "Post",  selectedIcon: Icon(Icons.credit_card)),
    NavigationDestination(icon: Icon(Icons.credit_card_outlined), label: "Restaurant",  selectedIcon: Icon(Icons.credit_card)),
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
          onDestinationSelected: (index){
            setState(() {
              tab = index;
            });
          },
          destinations: appBarDestinations),

    );

    
  }

  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue)
  ];
}
