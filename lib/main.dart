import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_work/features/loading_screen/bloc/fetching_data_bloc/fetching_data_bloc.dart';
import 'package:webspark_test_work/features/loading_screen/bloc/send_data_bloc/send_data_bloc.dart';

import 'core/ui/theme.dart';
import 'features/main_screen/view/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchingDataBloc>(create: (context) => FetchingDataBloc()),
        BlocProvider<SendDataBloc>(create: (context) => SendDataBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const MainScreen(),
      ),
    );
  }
}
