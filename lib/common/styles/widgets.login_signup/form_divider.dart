import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';

class NFormDivider extends StatelessWidget {
  const NFormDivider({super.key, required this.dividerText});
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: NColors.grey,
            thickness: 2,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 20),
        ),
        Flexible(
          child: Divider(
            color: NColors.grey,
            thickness: 2,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
