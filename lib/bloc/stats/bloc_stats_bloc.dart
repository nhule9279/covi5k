import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import './events_stats_bloc.dart';
import './states_stats_bloc.dart';
import '../../models/stats.dart';
import '../../helpers/stats_helper.dart';
import '../../helpers/exceptions_helper.dart';

class StatsBloc extends Bloc<StatsEvents, StatsState> {
  final StatsHelper statsHelper;
  List<Stats> statsData;

  StatsBloc({this.statsHelper}) : super(StatsInitState());

  @override
  Stream<StatsState> mapEventToState(StatsEvents event) async* {
    switch (event) {
      case StatsEvents.fetchStats:
        print(StatsEvents.fetchStats);
        yield StatsLoading();
        try {
          print('get statsData');
          statsData = await statsHelper.getStats();

          yield StatsLoaded(statsData: statsData);
        } on SocketException {
          yield StatsError(error: NoInternetException('No Internet'));
        } on HttpException {
          yield StatsError(error: NoServiceFoundException('No Service Found'));
        } on FormatException {
          yield StatsError(
              error: InvalidFormatException('Invalid Response format'));
        } catch (e) {
          print('Unknown Error');
          yield StatsError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }
  }
}
