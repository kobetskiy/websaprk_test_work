part of 'fetching_data_bloc.dart';

sealed class FetchingDataEvent extends Equatable {
  const FetchingDataEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends FetchingDataEvent {}
