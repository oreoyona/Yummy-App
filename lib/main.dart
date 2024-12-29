import 'package:flutter/material.dart';
import 'package:starter/constants.dart';
import 'package:starter/home.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

  void changeThemeMode() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gloire App",
      theme: themeMode == ThemeMode.light
          ? ThemeData(
              colorSchemeSeed: colorSelected.color,
              useMaterial3: true,
              brightness: Brightness.light,
            )
          : ThemeData(
              colorSchemeSeed: colorSelected.color,
              useMaterial3: true,
              brightness: Brightness.dark),
      home: Home(
        changeThemeMode: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
      ),
    );
  }
}
