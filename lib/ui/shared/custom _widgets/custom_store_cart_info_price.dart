import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class CustomStoreCartInfoPrice extends StatelessWidget {
  final String title;
  final double price;
  final Color? titleColor;

  const CustomStoreCartInfoPrice({
    super.key,
    required this.title,
    required this.price,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth(20),
            fontWeight: FontWeight.bold,
            color: titleColor ?? Colors.purple,
          ),
        ),
        Container(
          width: screenWidth(3.4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${price.round()}.${((price * 100) % 100).round()}",
                style: TextStyle(
                  fontSize: screenWidth(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "SP",
                style: TextStyle(
                  fontSize: screenWidth(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
