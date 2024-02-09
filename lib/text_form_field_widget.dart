import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;

  final String? hintText;
  final Widget? prefixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function? functionValidate;
  final String? parametersValidate;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;

  const TextFormFieldWidget(
      {required this.hintText,
      this.focusNode,
      this.textInputType,
      this.defaultText,
      this.obscureText = false,
      this.controller,
      this.functionValidate,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
      this.onSubmitField,
      this.onFieldTap,
      this.prefixIcon});

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  double bottomPaddingToError = 12;
  static var primaryColor = Color.fromRGBO(121, 121, 121, 1);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextFormField(
          cursorColor: primaryColor,
          obscureText: widget.obscureText!,
          keyboardType: widget.textInputType,
          textInputAction: widget.actionKeyboard,
          focusNode: widget.focusNode,
          // style: GoogleFonts.poppins(
          //   textStyle: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w500,
          //     //height: 1.50 * pageratio,
          //     color: ColorConstants.SecondaryColor,
          //   ),
          // ),
          initialValue: widget.defaultText,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            // hintStyle: GoogleFonts.poppins(
            //   textStyle: const TextStyle(
            //     fontSize: 16,
            //     fontWeight: FontWeight.w500,
            //     //height: 1.50 * pageratio,
            //     color: ColorConstants.SecondaryColor,
            //   ),
            // ),
            contentPadding: EdgeInsets.only(
                top: 12, bottom: bottomPaddingToError, left: 8.0, right: 8.0),
            isDense: true,
            // errorStyle: GoogleFonts.poppins(
            //   textStyle: const TextStyle(
            //     fontSize: 16,
            //     fontWeight: FontWeight.w500,
            //     //height: 1.50 * pageratio,
            //     color: Color.fromRGBO(196, 63, 63, 1),
            //   ),
            // ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          controller: widget.controller,
          validator: (value) {
            if (widget.functionValidate != null) {
              String resultValidate =
                  widget.functionValidate!(value, widget.parametersValidate);
              if (resultValidate != null) {
                return resultValidate;
              }
            }
            return null;
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmitField != null) widget.onSubmitField!();
          },
          onTap: () {
            if (widget.onFieldTap != null) widget.onFieldTap!();
          },
        ),
      ),
    );
  }
}

String commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return "null";
}

String requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return "null";
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
