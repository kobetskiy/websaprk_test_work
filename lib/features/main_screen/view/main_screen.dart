import 'package:flutter/material.dart';
import 'package:webspark_test_work/features/loading_screen/view/loading_screen.dart';
import 'package:webspark_test_work/features/models/static_values.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final urlTextController = TextEditingController(text: Constants.url);

  void startCountingProcess() {
    if (urlTextController.text != Constants.url) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Url is not valid'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Set valid API base URL in order to continue'),
            const SizedBox(height: 20),
            TextField(
              controller: urlTextController,
              decoration: const InputDecoration(
                labelText: "API URL",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),

              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: startCountingProcess,
          child: const Center(
            child: Text('Start counting process'),
          ),
        ),
      ),
    );
  }
}
