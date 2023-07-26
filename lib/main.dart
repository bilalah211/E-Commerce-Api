import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_api/resources/components/general%20exception/general_exception.dart';
import 'package:product_api/resources/components/internetException/internet_exception.dart';
import 'package:product_api/view/home_screen.dart';

import 'view/first screen/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FirstScreen());
  }
}
