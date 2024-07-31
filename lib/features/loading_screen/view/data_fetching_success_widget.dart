import 'package:flutter/material.dart';
import 'package:webspark_test_work/features/loading_screen/bloc/fetching_data_bloc/fetching_data_bloc.dart';

class DataFetchingSuccessWidget extends StatelessWidget {
  const DataFetchingSuccessWidget({super.key, required this.state});

  final FetchingDataSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Text(
          'All calculation has finished, you can send your results to server',
          textAlign: TextAlign.center,
        ),
        const Text('100%', style: TextStyle(fontSize: 24)),
        const Spacer(),
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: const Center(
              child: Text('Send result to server'),
            ),
          ),
        ),
      ],
    );
  }
}
