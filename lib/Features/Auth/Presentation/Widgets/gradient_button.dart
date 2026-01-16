import 'package:flutter/material.dart';
import '../../../../Core/Theme/AppPallet.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const GradientButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppPallet.gradient1,
            AppPallet.gradient2,
          ],
               begin: Alignment.bottomLeft,
               end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppPallet.transparentColor,
          shadowColor: AppPallet.transparentColor,
        ),
        child: Text(buttonText, style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }
}
