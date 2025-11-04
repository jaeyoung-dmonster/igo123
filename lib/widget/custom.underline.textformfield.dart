import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomUnderlineTextFormField extends StatefulWidget {
  final String hint;
  final bool obscure;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final bool showCursor;
  final Color underlineColor;
  final Color focusedUnderlineColor;
  final String? errorText;
  final bool enabled;
  final double? height;
  final double? width;
   final double vertical;
  final double horizontal;
  final bool enablePasswordToggle;
    final Widget? suffixIcon;
      final Color? errorBorderColor;
  final bool isValid;


  const CustomUnderlineTextFormField({
    Key? key,
    required this.hint,
    this.obscure = false,
    this.readOnly = false,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.onTap,
    this.onSubmitted,
    this.showCursor = true,
    this.underlineColor = Colors.grey,
    this.focusedUnderlineColor = Colors.blue,
    this.errorText,
  this.height,
  this.width,
    this.vertical =18,
    this.horizontal =24,
    this.enablePasswordToggle=false,
    this.suffixIcon,    this.errorBorderColor,    this.isValid = false,


  }) : super(key: key);

  @override
  _CustomUnderlineTextFormFieldState createState() => _CustomUnderlineTextFormFieldState();
}

class _CustomUnderlineTextFormFieldState extends State<CustomUnderlineTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:  widget.vertical, horizontal: widget.horizontal),
      child: Container(
        height: widget.height,
        width: widget.width,
        child:  TextFormField(
      cursorColor: widget.focusedUnderlineColor,
      onFieldSubmitted: widget.onSubmitted,
      focusNode: widget.focusNode,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      showCursor: widget.showCursor,
      maxLength: widget.maxLength,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        errorText: widget.errorText,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.focusedUnderlineColor),
        ),
                    errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.errorBorderColor ?? Colors.red),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.errorBorderColor ?? Colors.red),
            ),
            errorStyle: TextStyle(
              color: widget.isValid ? Colors.green : Colors.red,
            ),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor),
        ),
              contentPadding: EdgeInsets.only(left: 8, right: 3, ),
                suffixIcon: widget.enablePasswordToggle
                    ? IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : widget.suffixIcon,

      ),
      )));
  }
}
