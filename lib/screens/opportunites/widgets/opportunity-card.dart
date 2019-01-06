import 'package:flutter/material.dart';
import 'package:serve/data/models.dart';
import 'package:intl/intl.dart';

class OpportunityCard extends StatelessWidget {
  OpportunityCard(this.opportunity);
  final Opportunity opportunity;

  formatDate(DateTime date) =>
      new DateFormat.yMMMMd("en_US").add_jm().format(date);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text(opportunity.title),
              subtitle: Text(formatDate(opportunity.start) +
                  " - " +
                  new DateFormat.jm("en_US").format(opportunity.end)),
            ),
          ],
        ),
      ),
    );
  }
}
