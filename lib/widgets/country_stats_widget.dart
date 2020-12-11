import 'package:flutter/material.dart';

import '../models/stats.dart';
import './metrics_grid_widget.dart';
import './country_search_widget.dart';
import './error_message_widget.dart';

class CountryStatsWidget extends StatefulWidget {
  final List<Stats> countriesStats;
  CountryStatsWidget(this.countriesStats);

  @override
  _CountryStatsWidgetState createState() => _CountryStatsWidgetState();
}

class _CountryStatsWidgetState extends State<CountryStatsWidget> {
  Stats countryData;
  String _countrySelected = 'VN';

  void _changeCountry(String countryCode) {
    setState(() {
      _countrySelected = countryCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    countryData = widget.countriesStats.firstWhere(
      (element) => element.code == _countrySelected,
      orElse: () => null,
    );
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
                CountrySearchWidget(_countrySelected, _changeCountry),
              ],
            ),
            Divider(
              color: Colors.white,
              height: 20,
            ),
            countryData == null
                ? ErrorMessage(
                    message:
                        'Not available data, please choose another country!',
                  )
                : MetricsGrigWidget(countryData),
          ],
        ),
      ),
    );
  }
}
