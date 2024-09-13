// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:term_1_reflection/assets.dart';
import 'package:term_1_reflection/models/models.dart';
import 'package:term_1_reflection/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EmailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UnderstoodMessageProvider(),
        )
      ],
      child: MaterialApp(
        title: 'REFLECTION',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors().darkGrey),
          ),
          scaffoldBackgroundColor: AppColors().white,
          textTheme: GoogleFonts.urbanistTextTheme().apply(
            bodyColor: AppColors().dark,
            displayColor: AppColors().dark,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.loginPage,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}


//check instructions on the assets folder 