import 'package:flutter/material.dart';

class ExpandedCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color textColor;

  ExpandedCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Defined gradient colors
    final color1 = Color.fromARGB(255, 51, 135, 204); // Lighter blue
    final color2 = Color.fromARGB(255, 105, 157, 236); // Darker blue

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color1, color2], // Using the predefined blue colors
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.title,
                style: TextStyle(color: this.textColor, fontSize: 25),
              ),
              Text(
                this.subTitle,
                style: TextStyle(
                  color: this.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
