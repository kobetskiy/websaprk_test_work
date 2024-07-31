part of 'fetching_data_bloc.dart';

sealed class FetchingDataState {}

final class FetchingDataInitial extends FetchingDataState {}

final class FetchingDataLoading extends FetchingDataState {}

final class FetchingDataSuccess extends FetchingDataState {}

final class FetchingDataFailure extends FetchingDataState {
  final Object error;

  FetchingDataFailure({required this.error});
}
