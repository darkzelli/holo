import 'package:flutter/material.dart';
class Option extends StatelessWidget {
  final String text;
  final String keymap;
  final GestureTapCallback? function;
  final int? iconUni;
  const Option({super.key, this.iconUni, required this.text,  this.function, required this.keymap});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Icon(IconData(iconUni ?? 0xe237, fontFamily: 'MaterialIcons'), size: 20, color: Color.fromARGB(255, 84, 83, 83)),
                  SizedBox(width: 8),
                  Text(text, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 84, 83, 83))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Icon(Icons.keyboard_command_key, size: 20, color: Color.fromARGB(255, 84, 83, 83)),
                  SizedBox(width: 8),
                  Text(keymap, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 84, 83, 83))),
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}