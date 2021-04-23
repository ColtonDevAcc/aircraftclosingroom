import 'package:aircraftclosingroom/core/global.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIconData;
  final bool obscure;
  final void Function(String) onTextChanged;
  final void Function()? onSuffixiconTap;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIconData,
    required this.obscure,
    required this.onTextChanged,
    this.onSuffixiconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTextChanged,
      style: TextStyle(
        color: Global.primaryColor,
        fontSize: 14.0,
      ),
      obscureText: obscure,
      cursorColor: Global.primaryColor,
      decoration: InputDecoration(
        labelText: hintText,
        prefix: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                prefixIcon,
                size: 18,
                color: Global.primaryColor,
              ),
            ],
          ),
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.primaryColor),
        ),
        //detecting icon push
        suffixIcon: GestureDetector(
          onTap: onSuffixiconTap,
          child: Icon(
            suffixIconData,
            size: 18,
            color: Global.primaryColor,
          ),
        ),
        labelStyle: TextStyle(color: Global.primaryColor),
        focusColor: Colors.orange,
      ),
    );
  }
}
