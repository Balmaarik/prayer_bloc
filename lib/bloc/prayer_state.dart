
import 'package:prayer_bloc/models/AthanTimes.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PrayerState extends Equatable {
  const PrayerState();
}

class InitialPrayerState extends PrayerState {
  @override
  List<Object> get props => [];
}


class PrayerLoadedState extends PrayerState {

  Timings item;

  PrayerLoadedState({@required this.item});

  @override
  // TODO: implement props
  List<Object> get props => [item];
}

class PrayerErrorState extends PrayerState {

  String message;

  PrayerErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
