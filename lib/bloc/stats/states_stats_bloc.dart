import 'package:equatable/equatable.dart';
import '../../models/stats.dart';

abstract class StatsState extends Equatable {
  @override
  List<Object> get props => [];
}

class StatsInitState extends StatsState {}

class StatsLoading extends StatsState {}

class StatsLoaded extends StatsState {
  final List<Stats> statsData;
  StatsLoaded({this.statsData});
}

class StatsError extends StatsState {
  final error;
  StatsError({this.error});
}
