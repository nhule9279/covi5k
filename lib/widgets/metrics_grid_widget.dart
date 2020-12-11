import 'package:flutter/material.dart';

import './metric_widget.dart';
import '../models/stats.dart';

class MetricsGrigWidget extends StatelessWidget {
  final Stats country;
  MetricsGrigWidget(this.country);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: GridView.count(
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
        crossAxisCount: 3,
        children: [
          MetricWidget(
            title: 'New\nConfirmed',
            cases: country.newConfirmed,
            color: Colors.yellowAccent,
          ),
          MetricWidget(
            title: 'New\nRecovered',
            cases: country.newRecovered,
            color: Colors.greenAccent,
          ),
          MetricWidget(
            title: 'New\nDeaths',
            cases: country.newDeaths,
            color: Colors.redAccent,
          ),
          MetricWidget(
            title: 'Total\nConfirmed',
            cases: country.totalConfirmed,
            color: Colors.yellowAccent,
          ),
          MetricWidget(
            title: 'Total\nRecovered',
            cases: country.totalRecovered,
            color: Colors.greenAccent,
          ),
          MetricWidget(
            title: 'Total\nDeaths',
            cases: country.totalDeaths,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
