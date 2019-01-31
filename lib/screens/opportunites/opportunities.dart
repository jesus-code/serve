import 'package:flutter/material.dart';
import 'package:serve/data/index.dart';
import 'package:serve/screens/opportunites/widgets/opportunity-list-item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OpportunitiesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "OPPORTUNITY LIST",
        ),
      ),
      body: OpportunitiesListPageBody(),
    );
  }
}

class OpportunitiesListPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }

  _buildListView() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('opportunities').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return OpportunitiesListItem(
                      opportunity: Opportunity.fromSnapshot(document),
                    );
                  }).toList(),
                );
            }
          },
        ));
  }
}
