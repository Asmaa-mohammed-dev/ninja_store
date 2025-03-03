import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.colors,
    required this.title,
    required this.onPressed,
  });

  final Color colors;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Material(
        elevation: 3,
        color: colors,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 410,
          height: 65,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
