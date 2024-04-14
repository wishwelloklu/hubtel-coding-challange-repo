import 'package:flutter/material.dart';


Widget textFormField({
  Function()? function,
  @required String? hintText,
  required BuildContext context,
  String? labelText,
  String? validateMsg,
  IconData? icon,
  IconData? prefixIcon,
  Color? iconColor,
  Color? prefixIconColor,
  Color? cursorColor,
  Color? textColor,
  Color? labelColor,
  Color? backgroundColor,
  double? vertical,
  @required TextEditingController? controller,
  bool validate = true,
  bool suggestion = false,
  TextInputType inputType = TextInputType.text,
  int? maxLine = 1,
  int? minLine = 1,
  bool validateEmail = false,
  double? width,
  enable = true,
  bool removeBorder = false,
  void Function()? onIconTap,
  TextInputAction? inputAction,
  void Function()? onEditingComplete,
  void Function(String text)? onTextChange,
  @required FocusNode? focusNode,
  bool readOnly = false,
  bool showBorderRound = true,
  Color? borderColor,
  TextCapitalization textCapitalization = TextCapitalization.sentences,
  int? maxLength,
  double borderWidth = 1,
  double borderRadius = 8,
  bool isDense = false,
  TextStyle? hintStyle,
}) {
  final theme = Theme.of(context);
  return Container(
    width: width,
    child: TextFormField(
      onTap: function,
      readOnly: readOnly,
      enableInteractiveSelection: true,
      enabled: enable,
      enableSuggestions: suggestion,
      keyboardType: inputType,
      controller: controller,
      minLines: minLine,
      maxLines: maxLine,
      maxLength: maxLength,
      focusNode: focusNode,
      autofocus: false,
      textInputAction: inputAction,
      cursorColor: cursorColor ?? theme.textTheme.bodySmall!.color,
      textCapitalization:
          validateEmail ? TextCapitalization.none : textCapitalization,
      style: TextStyle(
          color: theme.textTheme.bodyMedium!.color,
          fontWeight: FontWeight.w400),
      onEditingComplete: () {
        print(controller!.text);
        focusNode!.unfocus();
        // onEditingComplete();
      },
      onChanged: onTextChange == null ? null : (text) => onTextChange(text),
      decoration: InputDecoration(
        // constraints: BoxConstraints(maxHeight: 40),
        isDense: isDense,
        hintText: hintText,
        hintStyle: hintStyle ?? theme.textTheme.bodySmall,
        labelText: labelText,
        labelStyle: TextStyle(color: theme.textTheme.bodyMedium!.color),
        filled: true,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10, vertical: vertical ?? 5),
        fillColor: backgroundColor ?? theme.colorScheme.background,
        suffixIcon: icon == null
            ? null
            : GestureDetector(
                onTap: onIconTap,
                child: Icon(icon, color: iconColor),
              ),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: prefixIconColor),
        enabledBorder: removeBorder
            ? InputBorder.none
            : showBorderRound
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  ),
        disabledBorder: removeBorder
            ? InputBorder.none
            : showBorderRound
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  ),
        focusedBorder: removeBorder
            ? InputBorder.none
            : showBorderRound
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  ),
        border: removeBorder
            ? InputBorder.none
            : showBorderRound
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? theme.colorScheme.background,
                      width: borderWidth,
                    ),
                  ),
        errorStyle: TextStyle(
          color: Colors.red,
        ),
      ),
    
    ),
  );
}
