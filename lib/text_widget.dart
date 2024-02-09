import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? weight;

  const CustomText(
      {required this.text,
      required this.size,
      required this.color,
      required this.weight,
      super.key});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double pageRatio = MediaQuery.of(context).size.width / baseWidth;
    return Text(
      widget.text,
      // style: GoogleFonts.workSans(
      //   textStyle: TextStyle(
      //     fontSize: widget.size,
      //     fontWeight: widget.weight,
      //     height: 1.50 * pageRatio,
      //     color: widget.color,
      //   ),
      //)
    );
  }
}
