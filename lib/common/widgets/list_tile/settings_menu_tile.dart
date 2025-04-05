import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';

class NSettingMenuTile extends StatelessWidget {
  const NSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 38, color: NColors.primary),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'MAJALLA',
          fontSize: 21,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'MAJALLA',
          fontSize: 15,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
