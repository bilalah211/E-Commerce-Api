import 'package:flutter/material.dart';
import 'package:product_api/resources/components/rounded%20button/rounded_button.dart';

class InternetException extends StatefulWidget {
  final VoidCallback onPressed;
  const InternetException({super.key, required this.onPressed});

  @override
  State<InternetException> createState() => _InternetExceptionState();
}

class _InternetExceptionState extends State<InternetException> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Icon(
            Icons.wifi_off,
            color: Colors.red,
            size: 100,
          )),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Unable to Process Results \n Please Check Internet Connect \n Try Again',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: widget.onPressed,
            child: Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                'Retry',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          )
        ],
      ),
    );
  }
}
