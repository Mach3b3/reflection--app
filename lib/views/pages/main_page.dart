// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_1_reflection/models/models.dart';
import 'package:term_1_reflection/routes/routes.dart';
import 'package:term_1_reflection/widgets/buttons.dart';
import 'package:term_1_reflection/widgets/text_input.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final understoodNote = Provider.of<UnderstoodMessageProvider>(context);

    TextEditingController understoodController = TextEditingController();
    TextEditingController notUnderstoodController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("Main Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<EmailProvider>(
          builder: (context, emailProvider, child) {
            final email = emailProvider.email;
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Welcome\nTo the main page!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Email: $email",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(height: 20),
                      TextInput(
                        hintText: "What you Understood",
                        controller: understoodController,
                      ),
                      const SizedBox(height: 10),
                      MyButton(
                        onPressed: () {
                          understoodNote
                              .setUnderstood(understoodController.text);
                          Navigator.pushNamed(
                              context, RouteManager.understoodPage);
                        },
                        text: 'Understood',
                      ),
                      const SizedBox(height: 30),
                      TextInput(
                        hintText: "What you did not understood",
                        controller: notUnderstoodController,
                      ),
                      const SizedBox(height: 10),
                      MyButton(
                        onPressed: () {
                          understoodNote
                              .setNotUnderstood(notUnderstoodController.text);
                          Navigator.pushNamed(
                              context, RouteManager.notUnderstoodPage);
                        },
                        text: 'Not Understood',
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
