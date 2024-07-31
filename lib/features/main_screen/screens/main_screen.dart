import 'package:flutter/material.dart';
import 'package:webspark_test_work/features/loading_screen/screens/loading_screen.dart';
import 'package:webspark_test_work/features/models/static_values.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final urlTextController = TextEditingController();

  void startCountingProcess() {
    if (urlTextController.text != StaticValues.url) {
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
      appBar: AppBar(
        title: const Text('Home screen'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Set valid API base URL in order to continue'),
            TextField(
              controller: urlTextController,
              autofocus: true,
              decoration: InputDecoration(
                prefix: IconButton(
                  onPressed: () => urlTextController.text = StaticValues.url,
                  icon: const Icon(Icons.link, size: 16),
                ),
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
