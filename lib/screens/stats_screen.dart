import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/country_stats_widget.dart';
import '../widgets/global_stats_widget.dart';
import '../bloc/stats/bloc_stats_bloc.dart';
import '../bloc/stats/events_stats_bloc.dart';
import '../bloc/stats/states_stats_bloc.dart';
import '../models/stats.dart';
import '../widgets/error_message_widget.dart';
import '../widgets/loading.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  _loadStats() {
    BlocProvider.of<StatsBloc>(context).add(StatsEvents.fetchStats);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Statistic'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadStats,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<StatsBloc, StatsState>(
                builder: (BuildContext context, StatsState state) {
                  if (state is StatsError) {
                    final error = state.error;
                    String message = '${error.message}\nTap to Retry.';
                    return ErrorMessage(
                      message: message,
                      onTap: _loadStats,
                    );
                  }
                  if (state is StatsLoaded) {
                    List<Stats> statsData = state.statsData;
                    return Column(children: [
                      GlobalStatsWidget(statsData.first),
                      CountryStatsWidget(statsData),
                    ]);
                  }
                  return Loading();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
