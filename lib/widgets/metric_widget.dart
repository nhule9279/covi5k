import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class MetricWidget extends StatelessWidget {
  final String title;
  final int cases;
  final Color color;
  MetricWidget(
      {@required this.title, @required this.cases, @required this.color});
  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###", "en_US");
    return GridTileBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FittedBox(
          alignment: Alignment.center,
          child: Text(
            title,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: color, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
      subtitle: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.cover,
          child: Text(
            '\n${formatter.format(cases)}',
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
