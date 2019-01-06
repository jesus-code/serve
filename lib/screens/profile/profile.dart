import 'package:flutter/material.dart';
import 'package:serve/data/index.dart';

class ProfilePage extends StatelessWidget {

  final User currentUser;
  ProfilePage(this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Text('Profile Page');
  }
}