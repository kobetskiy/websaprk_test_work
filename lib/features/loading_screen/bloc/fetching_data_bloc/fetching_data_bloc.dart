import 'package:bloc/bloc.dart';
import 'package:webspark_test_work/features/loading_screen/services/api_service.dart';
import 'package:webspark_test_work/features/models/static_values.dart';

part 'fetching_data_event.dart';
part 'fetching_data_state.dart';

class FetchingDataBloc extends Bloc<FetchingDataEvent, FetchingDataState> {
  FetchingDataBloc() : super(FetchingDataInitial()) {
    final apiService = ApiService();
    on<FetchData>((event, emit) async {
      try {
        emit((FetchingDataLoading()));
        Constants.results = await apiService.getResults();
        emit(FetchingDataSuccess());
      } catch (e) {
        emit(FetchingDataFailure(error: e.toString()));
      }
    });
  }
}
