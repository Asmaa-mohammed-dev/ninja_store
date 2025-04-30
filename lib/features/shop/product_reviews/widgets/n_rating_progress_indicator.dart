import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/device/device_utility.dart';

class NRatingProgressIndicator extends StatelessWidget {
  const NRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: NDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: NColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(NColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
