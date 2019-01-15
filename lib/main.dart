import 'package:flutter/material.dart';
import 'package:serve/screens/opportunites/opportunities.dart';
import 'package:serve/screens/profile/profile.dart';
import 'data/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final User currentUser = new User();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Serve',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: Material(
              color: Colors.blue,
              child: TabBar(
                tabs: [
                  Tab(text:'Home', icon: Icon(Icons.home)),
                  Tab(text:'Opportunities', icon: Icon(Icons.map)),
                  Tab(text:'Profile', icon: Icon(Icons.person)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Icon(Icons.home),
                OpportunitiesListPage(),
                ProfilePage(currentUser),
              ],
            ),
          ),
        ));
  }
}
