// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_1_reflection/models/models.dart';
import 'package:term_1_reflection/widgets/buttons.dart';
import 'package:term_1_reflection/widgets/text_input.dart';

class NotUnderstoodPage extends StatefulWidget {
  const NotUnderstoodPage({
    Key? key,
  });

  @override
  State<NotUnderstoodPage> createState() => _NotUnderstoodPageState();
}

class _NotUnderstoodPageState extends State<NotUnderstoodPage> {
  final TextEditingController _improvementPlanController =
      TextEditingController();
  String? _improvementPlanErrorText;

  @override
  Widget build(BuildContext context) {
    final emailProvider = Provider.of<EmailProvider>(context);
    final understoodNote = Provider.of<UnderstoodMessageProvider>(context);
    final String email = emailProvider.email;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Understood"),
        leading: const MyBackButton(),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email: $email", // Display email
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w200),
                  ),
                  Container(
                    // Wrap message in a container
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "You did not Understand: ${understoodNote.notUnderstood ?? ''}",
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
                    hintText: "Improvement Plan",
                    controller: _improvementPlanController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          _improvementPlanErrorText =
                              'Please enter your improvement plan';
                        });
                        return _improvementPlanErrorText;
                      }
                      return null;
                    },
                  ),
                  if (_improvementPlanErrorText != null)
                    Text(
                      _improvementPlanErrorText!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 10),
                  MyButton(
                    onPressed: () {
                      if (_improvementPlanController.text.isNotEmpty) {
                        final snackBar = SnackBar(
                          content:
                              Text("$email, improvement plan acknowledged"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // Clear error text when improvement plan is entered
                        setState(() {
                          _improvementPlanErrorText = null;
                        });
                      } else {
                        setState(() {
                          _improvementPlanErrorText =
                              'Please enter your improvement plan';
                        });
                      }
                    },
                    text: 'Acknowledge Improvement Plan',
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
