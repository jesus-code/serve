import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:serve/data/index.dart';
import 'package:serve/screens/opportunites/widgets/opportunity-list-item.dart';

class OpportunitiesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OpportunityScopedModel opportunityModel = OpportunityScopedModel();
    opportunityModel.parseOpportunitiesFromResponse(95, 1);

    return new ScopedModel<OpportunityScopedModel>(
      model: opportunityModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "OPPORTUNITY LIST",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: OpportunitiesListPageBody(),
      ),
    );
  }
}

class OpportunitiesListPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<OpportunityScopedModel>(
      builder: (context, child, model) {
        return model.isLoading
            ? _buildCircularProgressIndicator()
            : _buildListView(context, 1, model);
      },
    );
  }

  _buildCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildListView(BuildContext context, int pageIndex, OpportunityScopedModel model) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: model.getOpportunitiesCount() == 0
          ? Center(child: Text("No opportunities available."))
          : 
          ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: model.getOpportunitiesCount(),
      // A callback that will return a widget.
      itemBuilder: (context, index) {
        // In our case, a DogCard for each doggo.
        return OpportunitiesListItem(
                    opportunity: model.opportunitiesList[index],
                  );
      },
          )
          // ListView.builder(
          //     itemCount: model.getOpportunitiesCount() + 2,
          //     itemBuilder: (context, index) {
          //       if (index == model.getOpportunitiesCount()) {
          //         if (model.hasMoreOpportunities) {
          //           pageIndex++;
          //           model.parseOpportunitiesFromResponse(95, pageIndex);
          //           return Padding(
          //             padding: const EdgeInsets.only(top: 16.0),
          //             child: Center(child: CircularProgressIndicator()),
          //           );
          //         }
          //         return Container();
          //       } else if (index == 0) {
          //         //0th index would contain filter icons
          //         return _buildFilterWidgets(screenSize);
          //       } else {
          //         if (index > model.getOpportunitiesCount() - 1) {
          //           return Container();
          //         }

          //         return OpportunitiesListItem(
          //           opportunity: model.opportunitiesList[index - 1],
          //         );
          //       }
          //     },
          //   ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("SORT"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("REFINE"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }
}
