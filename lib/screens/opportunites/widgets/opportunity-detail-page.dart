import 'package:flutter/material.dart';
import 'package:serve/data/index.dart';

class OpportunityDetailPage extends StatefulWidget {
  final Opportunity opportunity;

  OpportunityDetailPage({this.opportunity});

  @override
  _OpportunityDetailPageState createState() =>
      _OpportunityDetailPageState(opportunity);
}

class _OpportunityDetailPageState extends State<OpportunityDetailPage>
    with TickerProviderStateMixin {
  final Opportunity opportunity;

  _OpportunityDetailPageState(this.opportunity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          opportunity.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildOpportunityDetailsPage(context),
    );
  }

  _buildOpportunityDetailsPage(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    opportunity.locationAddress,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  opportunity.locationCity,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.person_add, 'RESERVE'),
          _buildButtonColumn(color, Icons.message, 'CONTACT'),
          _buildButtonColumn(color, Icons.near_me, 'NAVIGATE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(opportunity.description,
        softWrap: true,
      ),
    );
    return ListView(
          children: [
            Image.asset(
              "",
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        );
  }


  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
