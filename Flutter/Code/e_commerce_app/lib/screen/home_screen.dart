
import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Cloud',
  'Beach',
  'Sunny',
];

class HomeScreen extends StatelessWidget{  
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: titles.length,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('AppBar Sample'),            
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            centerTitle: true,
            leading: const IconButton(icon: Icon(Icons.density_medium,), onPressed: null,),        
            actions: const [
              IconButton(onPressed: null, icon: Icon(Icons.login)),
              IconButton(onPressed: null, icon: Icon(Icons.shopping_bag_outlined)),
            ],
            flexibleSpace: const SizedBox(height: 32.0, width: 16.0, child: Text('Flexible')),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.cloud_outlined),
                  text: titles[0],
                ),
                Tab(
                  icon: const Icon(Icons.beach_access_sharp),
                  text: titles[1],
                ),
                Tab(
                  icon: const Icon(Icons.brightness_5_sharp),
                  text: titles[2],
                ),
              ],
            ),
          ),
        body: const Text('HomeScreen'),
      )
    );    
  }
}