// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_1_reflection/models/models.dart';
import 'package:term_1_reflection/widgets/buttons.dart';
import 'package:term_1_reflection/widgets/text_input.dart';

class UnderstoodPage extends StatefulWidget {
  const UnderstoodPage({Key? key});

  @override
  State<UnderstoodPage> createState() => _UnderstoodPageState();
}

class _UnderstoodPageState extends State<UnderstoodPage> {
  late TextEditingController _strategiesController;
  String? _strategiesErrorText;

  @override
  void initState() {
    super.initState();
    _strategiesController = TextEditingController();
  }

  @override
  void dispose() {
    _strategiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailProvider = Provider.of<EmailProvider>(context);
    final understoodNote = Provider.of<UnderstoodMessageProvider>(context);
    final String email = emailProvider.email;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Understood"),
        leading: const MyBackButton(),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: OverflowBar(
                overflowSpacing: 5,
                children: [
                  Text(
                    "Email: $email", // Display email
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    // Wrap message in a container
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "You Understand: ${understoodNote.understood ?? 'No message'}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w200,
                              fontSize: 16), // Decrease font size
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextInput(
                    hintText: "Strategies Used",
                    controller: _strategiesController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          _strategiesErrorText = 'Please enter your strategies';
                        });
                        return _strategiesErrorText;
                      }
                      return null;
                    },
                  ),
                  if (_strategiesErrorText != null)
                    Text(
                      _strategiesErrorText!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 10),
                  MyButton(
                    onPressed: () {
                      if (_strategiesController.text.isNotEmpty) {
                        final snackBar = SnackBar(
                          content: Text("$email, your strategies are received"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // Clear error text when strategies are entered
                        setState(() {
                          _strategiesErrorText = null;
                        });
                      } else {
                        // Set error text when strategies are not entered
                        setState(() {
                          _strategiesErrorText = 'Please enter your strategies';
                        });
                      }
                    },
                    text: 'Acknowledge Strategies',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
