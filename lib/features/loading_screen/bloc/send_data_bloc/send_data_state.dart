part of 'send_data_bloc.dart';

sealed class SendDataState {}

final class SendDataInitial extends SendDataState {}

final class SendDataLoading extends SendDataState {}

final class SendDataSuccess extends SendDataState {}

final class SendDataFailure extends SendDataState {
  final Object error;

  SendDataFailure({required this.error});
}
