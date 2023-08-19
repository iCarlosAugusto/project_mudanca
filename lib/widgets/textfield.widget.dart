import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidget extends StatefulWidget {
    TextfieldWidget(
      {super.key,
      this.label,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.isPasswordField = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.margin,
      this.inputFormatters,
      this.initialValue,
      this.maxLines,
      this.minLines,
      this.maxLength
    });

  final String? label;
  final String? hintText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final EdgeInsets? margin;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  bool isPasswordField = false;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {

    bool isObscureText = true;

    handleShowPassword() {
      setState(() {
        isObscureText = !isObscureText;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.validator,
        style: const TextStyle(color: Color(0xFF95A1AC)),
        minLines: widget.minLines,
        maxLines: 1,
        maxLength: widget.maxLength,
        obscureText: widget.isPasswordField ? isObscureText : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.isPasswordField 
            ? Visibility(
              visible: isObscureText,
              replacement: IconButton(
                onPressed: handleShowPassword,
                icon: const Icon(Icons.visibility_off_outlined),
              ),
              child: IconButton(
                onPressed: handleShowPassword, 
                icon: const Icon(Icons.visibility_outlined)
              )
            ) 
            : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          labelText: widget.label,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
