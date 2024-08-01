import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_work/features/loading_screen/bloc/send_data_bloc/send_data_bloc.dart';
import 'package:webspark_test_work/features/points_list/view/points_list_screen.dart';

import 'export.dart';

class DataFetchingSuccessWidget extends StatefulWidget {
  const DataFetchingSuccessWidget({super.key});

  @override
  State<DataFetchingSuccessWidget> createState() =>
      _DataFetchingSuccessWidgetState();
}

class _DataFetchingSuccessWidgetState extends State<DataFetchingSuccessWidget> {
  final _sendDataBloc = SendDataBloc();

  void sendingDataResultScreen(BuildContext context, SendDataState state) {
    if (state is SendDataSuccess) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PointsListScreen(),
        ),
      );
    }
    if (state is SendDataFailure) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SendingDataFailureScreen(error: state.error),
        ),
      );
    }
  }

  @override
  void dispose() {
    _sendDataBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _sendDataBloc,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            'All calculation has finished, you can send your results to server',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text('100%', style: TextStyle(fontSize: 24)),
          const Spacer(),
          BlocConsumer<SendDataBloc, SendDataState>(
            listener: (context, state) {
              sendingDataResultScreen(context, state);
            },
            builder: (context, state) {
              return SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: state is SendDataLoading
                      ? null
                      : () => _sendDataBloc.add(SendData()),
                  child: Center(
                    child: state is SendDataLoading
                        ? Transform.scale(
                            scale: 0.8,
                            child: const CircularProgressIndicator(),
                          )
                        : const Text('Send result to server'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
