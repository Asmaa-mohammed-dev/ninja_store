import 'package:flutter/material.dart';

class NsectionHeading extends StatelessWidget {
  const NsectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "إظهار الكل",
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MAJALLA',
            fontSize: 21,
            color: textColor,
          ),
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 15,
                color: textColor,
              ),
            ),
          ),
      ],
    );
  }
}
