import 'package:flutter/material.dart';
import 'package:project_app/resources/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      this.buttonColor = const Color.fromARGB(255, 39, 151, 42),
      this.textColor = AppColor.whiteColor,
      required this.title,
      required this.onPress,
      this.width = 60,
      this.height = 50,
      this.loading = false})
      : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final Color textColor, buttonColor;

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(50)),
          child: loading
              ? Center(child: const CircularProgressIndicator())
              : Center(
                  child: Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white)))),
    );
  }
}
