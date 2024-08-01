import 'package:flutter/material.dart';

class SendingDataFailureScreen extends StatelessWidget {
  const SendingDataFailureScreen({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sending Data Failure')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
