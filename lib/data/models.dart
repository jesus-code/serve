
class Opportunity {
  int id;
  String title;
  String description;
  String locationAddress;
  String locationCity;
  String locationState;
  DateTime start;
  DateTime end;
  int numberVolunteers;
  List<String> interests;

  Opportunity(
      {this.id,
      this.title,
      this.description,
      this.locationAddress,
      this.locationCity,
      this.locationState,
      this.start,
      this.end,
      this.numberVolunteers,
      this.interests});

  Opportunity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    locationAddress = json['locationAddress'];
    locationCity = json['locationCity'];
    locationState = json['locationState'];
    start = DateTime.parse(json['start']);
    end = DateTime.parse(json['end']);
    numberVolunteers = json['numberVolunteers'];
    interests = json['interests'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['locationAddress'] = this.locationAddress;
    data['locationCity'] = this.locationCity;
    data['locationState'] = this.locationState;
    data['start'] = this.start;
    data['end'] = this.end;
    data['numberVolunteers'] = this.numberVolunteers;
    data['interests'] = this.interests;
    return data;
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