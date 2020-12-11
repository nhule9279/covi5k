class Stats {
  final String name;
  final String code;
  final String slug;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final DateTime date;
  Stats(
      {this.name,
      this.code,
      this.date,
      this.newConfirmed,
      this.newDeaths,
      this.newRecovered,
      this.slug,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered});
}
