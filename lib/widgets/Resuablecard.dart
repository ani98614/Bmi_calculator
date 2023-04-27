import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  final VoidCallback? onpressed;
  final Color colour;
  final Widget? cardChild;
  ResuableCard({required this.colour, this.cardChild, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
