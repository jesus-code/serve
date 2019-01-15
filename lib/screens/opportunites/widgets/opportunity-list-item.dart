import 'package:flutter/material.dart';
import 'package:serve/data/index.dart';
import 'package:serve/screens/opportunites/widgets/opportunity-detail-page.dart';
import 'package:intl/intl.dart';

class OpportunitiesListItem extends StatelessWidget {
  final Opportunity opportunity;

  OpportunitiesListItem({
    @required this.opportunity,
  });

  formatDate(DateTime date) =>
      new DateFormat.yMMMMd("en_US").add_jm().format(date);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.map),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OpportunityDetailPage(opportunity: opportunity);
            },
          ),
        );
      },
      title: Text(opportunity.title),
      subtitle: Text(formatDate(opportunity.start) +
          " - " +
          new DateFormat.jm("en_US").format(opportunity.end)),
    );
  }
}
