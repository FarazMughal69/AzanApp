import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double size;
  final Color bgClr;
  final Icon? icon;
  final Image? image;
  final VoidCallback onPressed;
  const CircularButton({
    super.key,
    this.size = 20,
    this.bgClr = Colors.transparent,
    this.icon,
    required this.onPressed,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: bgClr,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            style: BorderStyle.solid,
            color: const Color.fromARGB(66, 163, 158, 158),
          ),
        ),
        child: Center(child: icon ?? image),
      ),
    );
  }
}
