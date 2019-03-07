import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serve/screens/opportunites/opportunities.dart';
import 'package:serve/screens/profile/profile.dart';
import 'package:serve/screens/welcome.dart';

import 'data/models.dart';

void main() => runApp(MyApp());

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class MyApp extends StatelessWidget {
  Future<User> getCurrentUser() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    return User.fromFirebaseUser(await _auth.currentUser());
//    return new User(firstName: "Bob", lastName: "Smith");
  }

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
                  Tab(text: 'Home', icon: Icon(Icons.home)),
                  Tab(text: 'Opportunities', icon: Icon(Icons.search)),
                  Tab(text: 'Profile', icon: Icon(Icons.person)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
//                HomePage(),
                WelcomePage(),
                OpportunitiesListPage(),
                FutureBuilder<User>(
                  future: getCurrentUser(),
                  builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press button to start.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Text('Awaiting result...');
                      case ConnectionState.done:
                        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                        return ProfilePage(snapshot.data);
                    }
                    return null; // unreachable
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
