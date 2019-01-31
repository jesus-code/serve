import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Opportunity {
  String id;
  DocumentReference provider;
  DocumentReference creator;
  String title;
  String description;
  DateTime start;
  DateTime end;
  String locationDescription;
  String locationCity;
  String locationState;
  int numVolunteers;
  bool kidFriendly;

  Opportunity(
      {this.id,
      this.provider,
      this.creator,
      this.title,
      this.description,
      this.start,
      this.end,
      this.locationDescription,
      this.locationCity,
      this.locationState,
      this.numVolunteers,
      this.kidFriendly});

  factory Opportunity.fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;

    Map<String, dynamic> data = snapshot.data;
    return Opportunity(
        id: snapshot.documentID,
        // provider: data['provider'].value.documentID,
        title: data['title'] as String,
        description: data['description'] as String,
        start: data['start'],
        end: data['end'],
        locationDescription: data['locationDescription'] as String,
        locationCity: data['locationCity'] as String,
        locationState: data['locationState'] as String,
        numVolunteers: data['numVolunteers'] as int,
        kidFriendly: data['kidFriendly'] as bool);
  }
}

class Interest {
  String id;
  String title;
  String description;
  List<String> synonyms;

  Interest({this.id, this.title, this.description, this.synonyms});

  Interest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    synonyms = json['synonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['synonyms'] = this.synonyms;
    return data;
  }
}

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  List<String> intertests;
  String organization;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.intertests,
      this.organization});

  User.fromFirebaseUser(FirebaseUser user) {
    id = user.uid;
    firstName = user.displayName;
    // lastName = json['lastName'];
    email = user.email;
    phone = user.phoneNumber;
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    intertests = json['intertests'].cast<String>();
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['intertests'] = this.intertests;
    data['organization'] = this.organization;
    return data;
  }
}

class Organization {
  String id;
  String name;
  List<String> admins;
  List<String> partners;
  List<String> volunteers;
  List<String> opportunities;

  Organization(
      {this.id,
      this.name,
      this.admins,
      this.partners,
      this.volunteers,
      this.opportunities});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    admins = json['admins'].cast<String>();
    partners = json['partners'].cast<String>();
    volunteers = json['volunteers'].cast<String>();
    opportunities = json['opportunities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['admins'] = this.admins;
    data['partners'] = this.partners;
    data['volunteers'] = this.volunteers;
    data['opportunities'] = this.opportunities;
    return data;
  }
}

class Partner {
  String id;
  String name;
  String email;
  String phone;
  List<String> admins;
  List<String> opportunities;

  Partner(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.admins,
      this.opportunities});

  Partner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    admins = json['admins'].cast<String>();
    opportunities = json['opportunities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['admins'] = this.admins;
    data['opportunities'] = this.opportunities;
    return data;
  }
}
