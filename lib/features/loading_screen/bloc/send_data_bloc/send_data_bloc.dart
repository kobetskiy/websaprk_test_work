import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webspark_test_work/features/loading_screen/services/api_service.dart';

part 'send_data_event.dart';
part 'send_data_state.dart';

class SendDataBloc extends Bloc<SendDataEvent, SendDataState> {
  SendDataBloc() : super(SendDataInitial()) {
    final apiService = ApiService();
    on<SendData>((event, emit) async {
      try {
        emit(SendDataLoading());
        int statusCode = await apiService.sendResult();
        if (statusCode == 200) {
          emit(SendDataSuccess());
        } else if (statusCode == 429) {
          emit(SendDataFailure(error: 'Too Many Requests'));
        } else if (statusCode == 500) {
          emit(SendDataFailure(error: 'Internal Server Error'));
        }
        emit(SendDataSuccess());
      } catch (e) {
        emit(SendDataFailure(error: e.toString()));
      }
    });
  }
}
