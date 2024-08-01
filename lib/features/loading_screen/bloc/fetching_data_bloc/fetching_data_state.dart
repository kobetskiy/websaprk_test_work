part of 'fetching_data_bloc.dart';

sealed class FetchingDataState extends Equatable {
  const FetchingDataState();

  @override
  List<Object> get props => [];
}

final class FetchingDataInitial extends FetchingDataState {}

final class FetchingDataLoading extends FetchingDataState {}

final class FetchingDataSuccess extends FetchingDataState {}

final class FetchingDataFailure extends FetchingDataState {
  final Object error;

  const FetchingDataFailure({required this.error});
}
