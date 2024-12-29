import 'package:flutter/material.dart';
import 'package:starter/constants.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.changeThemeMode,
  }) : super(key: key);

  final Function changeThemeMode;

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      icon: isBright
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
      onPressed: () => changeThemeMode(),
    );
  }
}


class ChangeColorButton extends StatelessWidget{
  const ChangeColorButton({
    super.key, 
    required this.changeColor, 
    required this.colorSelected
    });

  final void Function(int) changeColor;
  final ColorSelection colorSelected;

  void selectColor(){

  }

  @override
  Widget build (BuildContext context){
    return  PopupMenuButton(

      icon: Icon(Icons.opacity_outlined, color: Theme.of(context).colorScheme.onSurfaceVariant),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context){
        return List.generate(ColorSelection.values.length, (index){
          final currentColor = ColorSelection.values[index];
          return PopupMenuItem(
            value: index,
            enabled: currentColor != colorSelected,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.opacity_outlined,
                  color: currentColor.color)

                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentColor.label)
                )
              ]
            )
          );
        });
      },
  onSelected: changeColor,
    );
  }
}