import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/my_app_state.dart' show MyAppState;
import 'providers/my_home_page_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: Consumer<MyAppState>(builder: (context, appState, child){
        return MaterialApp(
        title: "Name App",
        theme: ThemeData.light(), // Light theme
        darkTheme: ThemeData.dark(),
        themeMode: appState.themeMode,
        //themeMode: ThemeMode.light,
        home: Scaffold(
          appBar: AppBar(
            title: Switch(value: appState.themeMode == ThemeMode.dark, onChanged: (value) =>{
              appState.toggleTheme()
            }),
          ),
          body: MyHomePage(),
        ),
      );
      })
    );
  }
}








