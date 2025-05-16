import 'package:flutter/material.dart';
import 'package:holo/pages/file.dart';
import 'package:holo/pages/nofile.dart';
import 'package:xterm/xterm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  late Terminal terminal;
  final terminalController = TerminalController();
  @override
  void initState(){
    super.initState();
    terminal = Terminal(
    maxLines: 1000,
    onOutput: (String data) {
      terminal.write(data);
    },
    );
  }
   

   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(19, 18, 18, 1),
        body: PageView(
          controller: _pageController,
          children: [
            
            TerminalView(
              terminal,
              controller: terminalController,
            )
          ],
        ),
      ),
    );
  }
}