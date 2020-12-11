import 'package:flutter/material.dart';

import 'metrics_grid_widget.dart';
import '../models/stats.dart';

class GlobalStatsWidget extends StatelessWidget {
  final Stats globalData;
  GlobalStatsWidget(this.globalData);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.public,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Worldwide',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
              height: 30,
            ),
            MetricsGrigWidget(globalData),
          ],
        ),
      ),
    );
  }
}
