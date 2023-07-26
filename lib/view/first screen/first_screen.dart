import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_api/view/home_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/f.png'),
                  Positioned(
                    top: 340,
                    left: 100,
                    child: InkWell(
                      onTap: () {
                        Get.to(const HomeScreen());
                      },
                      child: AnimatedContainer(
                        height: 45,
                        width: 200,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.orangeAccent,
                                  blurRadius: 4,
                                  offset: Offset(0, 2))
                            ],
                            gradient: LinearGradient(colors: [
                              Colors.pink.shade100,
                              Colors.amber.shade100,
                            ]),
                            borderRadius: BorderRadius.circular(20)),
                        duration: const Duration(milliseconds: 100),
                        child: Center(
                            child: Text(
                          'GET STARTED',
                          style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade800),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
