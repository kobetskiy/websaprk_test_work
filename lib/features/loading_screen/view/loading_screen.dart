import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_work/features/loading_screen/bloc/fetching_data_bloc/fetching_data_bloc.dart';

import 'export.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<LoadingScreen> {
  final _fetchingDataBloc = FetchingDataBloc();

  @override
  void initState() {
    super.initState();
    _fetchingDataBloc.add(FetchData());
  }

  @override
  void dispose() {
    _fetchingDataBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Load points')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder(
          bloc: _fetchingDataBloc,
          builder: (context, state) {
            if (state is FetchingDataSuccess) {
              return const DataFetchingSuccessWidget();
            }
            if (state is FetchingDataFailure) {
              return DataFetchingFailureWidget(error: state.error);
            }
            return const DataFetchingLoadingWidget();
          },
        ),
      ),
    );
  }
}
