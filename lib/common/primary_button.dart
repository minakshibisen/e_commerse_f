import 'package:flutter/material.dart';
import '../utils/loading_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double height;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final BuildContext context;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    this.borderColor ,
    required this.onPressed,
    required this.context,
    this.text = "",
    this.color,
    this.textColor = Colors.white,
    this.height = 50,
    this.isLoading = false,
  });

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        if (!isLoading) {
          onPressed();
        }
      },
      child: Container(
        height: height,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: [
              borderColor ??
              color ?? Theme.of(context).colorScheme.primary,
              color?.withOpacity(.7) ??
                  Theme.of(context).colorScheme.primary.withOpacity(.7),
            ])),
        child: Center(
          child: isLoading
              ? LoadingWidget(
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              : Text(
                  text,
                  style: TextStyle(
                      color:
                          textColor ?? Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
        ),

      ),
    );
  }
}
