import 'package:flutter/material.dart';
import 'package:serve/data/index.dart';
import 'package:serve/screens/opportunites/widgets/opportunity-card.dart';
import 'package:serve/sample-data/sample.dart';


class OpportunitiesPage extends StatefulWidget {
  OpportunitiesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage> {
  @override
  Widget build(BuildContext context) {
    List<Opportunity> opportunities = sampleOpportunities;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OpportunityList(opportunities),
    );
  }
}

class OpportunityList extends StatelessWidget {

  final List<Opportunity> opportunities;
  OpportunityList(this.opportunities);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: opportunities.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return OpportunityCard(opportunities[int]);
      },
    );
  }
}