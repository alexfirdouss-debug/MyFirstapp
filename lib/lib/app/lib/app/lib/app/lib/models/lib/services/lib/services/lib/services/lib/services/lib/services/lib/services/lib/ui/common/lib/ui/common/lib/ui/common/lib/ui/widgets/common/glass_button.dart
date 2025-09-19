import 'package:flutter/material.dart';
import '../../common/app_colors.dart';

class GlassButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const GlassButton({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.glass.withOpacity(0.3),
        onPrimary: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
