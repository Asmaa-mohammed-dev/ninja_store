import 'package:flutter/material.dart';
import 'package:ninja_store/features/shop/screens/home/widgets/widgets/n_circular_container.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/helpers/helper_functions.dart';

class NChoiceChip extends StatelessWidget {
  const NChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = NHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? NColors.white : null),
      avatar:
          isColor
              ? NCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: NHelperFunctions.getColor(text)!,
              )
              : null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      shape: isColor ? CircleBorder() : null,
      padding: isColor ? EdgeInsets.all(0) : null,
      selectedColor: isColor ? NHelperFunctions.getColor(text)! : null,
      backgroundColor: isColor ? NHelperFunctions.getColor(text)! : null,
    );
  }
}
