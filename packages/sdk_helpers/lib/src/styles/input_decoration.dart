import 'package:flutter/material.dart';

class BorderlessInputDecoration extends InputDecoration {
  const BorderlessInputDecoration({
    super.labelText,
    super.labelStyle,
    super.hintText,
    super.hintStyle,
    super.helperText,
    super.helperStyle,
    super.errorText,
    super.errorStyle,
    super.errorMaxLines,
    super.isDense,
    super.contentPadding,
    super.prefixIcon,
    super.prefixIconConstraints,
    super.suffixIcon,
    super.suffixIconConstraints,
    super.counterText,
    super.counterStyle,
  }) : super(
         border: InputBorder.none,
         enabledBorder: InputBorder.none,
         focusedBorder: InputBorder.none,
         errorBorder: InputBorder.none,
         focusedErrorBorder: InputBorder.none,
       );
}
