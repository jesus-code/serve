import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: <Widget>[
      _topImage(),
      _intro(),
    ]));
  }

  Widget _topImage() => Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Image.asset(
            'images/volunteer.jpg',
            fit: BoxFit.cover,
            height: 225,
          ),
          Container(
              constraints: BoxConstraints.expand(height: 30),
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Center(
                child: Text(
                  'Welcome to Serve',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      );

  Widget _intro() => Container(
      margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Center(
          child: Text(
              "This is your chance! Your chance to do something bigger than "
              "yourself. Your chance to use the gifts and talents God has "
              "given you to help others achieve their dreams! \n\nFeel "
              "free to start small, find something that works with your "
              "schedule. \n\nThe world needs help, give it!",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ))));

  Widget _chooseOrg() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("What organization are you a part of?"),
          DropdownButton<String>(items: getOrgs(), onChanged: (String newVal) => changeOrg((newVal)))
        ],
      );

  Widget _login() => Row(
        children: <Widget>[
          FlatButton(
            child: Text("Login to Google"),
            onPressed: googleLogin(),
          )
        ],
      );

  googleLogin() {}

  getOrgs() {
    var _orgs = ["Lutheran Chuch of Hope", "Valley E-Free", "Celebration Church"];
    return _orgs
        .map((String org) => DropdownMenuItem<String>(
              value: org,
              child: Text(org),
            ))
        .toList();
  }

  changeOrg(String newValue) {
//    setState()
  }
}
