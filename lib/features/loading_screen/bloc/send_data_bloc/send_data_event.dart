part of 'send_data_bloc.dart';

sealed class SendDataEvent extends Equatable {
  const SendDataEvent();

  @override
  List<Object> get props => [];
}

class SendData extends SendDataEvent {}
