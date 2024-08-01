import 'package:flutter/material.dart';
import 'package:webspark_test_work/features/loading_screen/view/loading_screen.dart';
import 'package:webspark_test_work/features/models/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final urlTextController = TextEditingController(text: Constants.apiUrl);

  void getPoints() {
    if (_key.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    }
  }

  final _key = GlobalKey<FormState>();

  String? validateURL(String? value) {
    if (value!.trim().isEmpty) {
      return "Enter URL";
    } else if (value != Constants.apiUrl) {
      return "Enter a valid URL";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Set valid API base URL in order to continue'),
            const SizedBox(height: 20),
            Form(
              key: _key,
              child: TextFormField(
                controller: urlTextController,
                decoration: const InputDecoration(
                  labelText: "API URL",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                validator: validateURL,
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
          onPressed: getPoints,
          child: const Center(
            child: Text('Start counting process'),
          ),
        ),
      ),
    );
  }
}
