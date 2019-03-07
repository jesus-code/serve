import 'package:flutter/material.dart';
import 'package:serve/data/index.dart';

class ProfilePage extends StatelessWidget {
  final User currentUser;
  ProfilePage(this.currentUser);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: <Widget>[
        ExpansionTile(
          title: Text("Profile"),
          children: <Widget>[
            Card(
                child: Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                initialValue: currentUser.firstName,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
            ))
          ],
        )
      ],
    ));
  }
}
