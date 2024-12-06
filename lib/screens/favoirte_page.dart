import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_app_state.dart' show MyAppState;

class FavoritesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if(appState.favorites.isEmpty){
      return Center(child: Text("No favorites yet."),);
    }

    return ListView(
      children: [
        Padding(padding: const EdgeInsets.all(20)),
        for(var pair in appState.favorites)
          ListTile(
            leading: ElevatedButton.icon(
              onPressed: () => {
              appState.removeItem(pair)
            }, 
            label: Text(""),
            icon: Icon(Icons.remove),
            ),
            title: Text(pair.asLowerCase),
          )
      ],
    );
  }

}