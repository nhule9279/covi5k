import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/stats.dart';

class StatsHelper {
  static const url = 'https://api.covid19api.com/summary';
  Future<List<Stats>> getStats() async {
    final response = await http.get(url);
    final data = json.decode(response.body);
    print(data['Countries'][0]);
    Stats statsGlobal = Stats(
      code: 'GL',
      name: 'Global',
      slug: 'global',
      date: DateTime.tryParse(data['Date']),
      newConfirmed: data['Global']['NewConfirmed'],
      newDeaths: data['Global']['NewDeaths'],
      newRecovered: data['Global']['NewRecovered'],
      totalConfirmed: data['Global']['TotalConfirmed'],
      totalDeaths: data['Global']['TotalDeaths'],
      totalRecovered: data['Global']['TotalRecovered'],
    );
    List<dynamic> statsCountries = data['Countries'];

    List<Stats> dataStats = [statsGlobal];
    print(dataStats);
    statsCountries.forEach((country) {
      dataStats.add(Stats(
          code: country['CountryCode'],
          date: DateTime.tryParse(country['Date']),
          name: country['Country'],
          newConfirmed: country['NewConfirmed'],
          newDeaths: country['NewDeaths'],
          newRecovered: country['NewRecovered'],
          slug: country['Slug'],
          totalConfirmed: country['TotalConfirmed'],
          totalDeaths: country['TotalDeaths'],
          totalRecovered: country['TotalRecovered']));
    });

    return dataStats;
  }
}
