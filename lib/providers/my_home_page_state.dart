import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/providers/my_app_state.dart';
import 'package:provider/provider.dart';
import '../screens/favoirte_page.dart';
import '../screens/generator_page.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  var currentPage = Placeholder();
  var appSate = MyAppState();

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch(selectedIndex){
      case 0: 
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      case 2:
        page = currentPage;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child:  NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  
                  destinations: [
                    NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text("Home")),
                    NavigationRailDestination(
                        icon: Icon(Icons.favorite), label: Text("Favorite")),
                    NavigationRailDestination(
                      icon: Icon(Icons.dark_mode), 
                      label: Switch(value: Provider.of<MyAppState>(context, listen: false).themeMode == ThemeMode.dark, onChanged: (value) =>{
                        //appSate.toggleTheme()
                        //context.watch<MyAppState>().toggleTheme()
                        Provider.of<MyAppState>(context, listen: false).toggleTheme()
                      })
                      )
                        
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) => {
                    setState((){
                      selectedIndex = value;
                    })
                  },
                ),
                // child: Column(
                //   children: [
                //   //   SwitchListTile(
                //   //   title: Text('Dark Mode'),
                //   //   value: appState.isDarkMode,
                //   //   onChanged: (value) {
                //   //     appState.toggleThemeMode();
                //   //   },
                //   // ),
                 
                //   ],
                // ),
                
                ),
              Expanded(
                  child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              )),
            ],
          ),
        );
      }
    );
  }
}