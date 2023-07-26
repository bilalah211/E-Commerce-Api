import 'package:flutter/material.dart';
import 'package:product_api/resources/components/rounded%20button/rounded_button.dart';

class GeneralException extends StatefulWidget {
  final VoidCallback onPressed;
  const GeneralException({super.key, required this.onPressed});

  @override
  State<GeneralException> createState() => _GeneralExceptionState();
}

class _GeneralExceptionState extends State<GeneralException> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Icon(
            Icons.error,
            color: Colors.red,
            size: 100,
          )),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Unable to Show you Results \n Something Went Wrong \n Try Again',
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
