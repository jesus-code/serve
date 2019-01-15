import 'package:scoped_model/scoped_model.dart';
import 'package:serve/data/models.dart';
import 'package:serve/sample-data/sample.dart';

import 'dart:async';
import 'dart:convert';

class AppState extends Model
{
  CurrentUser user;

}
class CurrentUser extends Model
{
  User user;
}

class OpportunityScopedModel extends Model {
  List<Opportunity> _opportunitiesList = [];
  bool _isLoading = true;
  bool _hasModeOpportunities = true;
  int currentOpportunityCount;

  List<Opportunity> get opportunitiesList => _opportunitiesList;

  bool get isLoading => _isLoading;

  bool get hasMoreOpportunities => _hasModeOpportunities;

  void addToOpportunitiesList(Opportunity opportunity) {
    _opportunitiesList.add(opportunity);
  }

  int getOpportunitiesCount() {
    return _opportunitiesList.length;
  }

  Future<List<Opportunity>> _getOpportunities(categoryId, pageIndex) async {
    // var response = await http.get(
    //   RemoteConfig.config["BASE_URL"] +
    //       RemoteConfig.config["BASE_PRODUCTS_URL"] +
    //       "&category=$categoryId&per_page=6&page=$pageIndex",
    //   headers: {
    //     "Authorization": RemoteConfig.config["AuthorizationToken"],
    //   },
    // ).catchError(
    //   (error) {
    //     return false;
    //   },
    // );

    // return json.decode(response.body);
    return sampleOpportunities; // obvs replace this when we get data
  }

  Future parseOpportunitiesFromResponse(int categoryId, int pageIndex) async {
    if (pageIndex == 1) {
      _isLoading = true;
    }

    notifyListeners();

    currentOpportunityCount = 0;

    var dataFromResponse = await _getOpportunities(categoryId, pageIndex); 

    dataFromResponse.forEach(
      (newOpportunity) {
        currentOpportunityCount++;

        addToOpportunitiesList(newOpportunity);
      },
    );

    if (pageIndex == 1) _isLoading = false;

    if (currentOpportunityCount < 6) {
      _hasModeOpportunities = false;
    }

    notifyListeners();
  }
}