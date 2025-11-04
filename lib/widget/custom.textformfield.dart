import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igo123/theme/my.color.dart';
import 'package:igo123/theme/my.text.dart';


class CustomLineAllTextFormField extends StatefulWidget {
  final String hint;
  final bool obscure;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final double vertical;
  final double horizontal;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final double? height;
  final double? width;
  final Function()? onTap;
  final Function(String)? onSubmitted;  // 이 줄을 추가합니다
  final bool showCursor;
  final Color focusColor;
  final Color enableColor;
  final Color disableColor;
    final String? errorText;
  final bool enabled;
  final bool enablePasswordToggle;
  final TextStyle? errorStyle ;
  final BorderSide? errorBorderSide ;
  final Widget? suffixIcon;
    final TextStyle? style;
  final TextStyle? hintStyle;
  final bool autofocus;


  const CustomLineAllTextFormField({
    Key? key,
    required this.hint,
    this.obscure = false,
    this.onTap,
    this.readOnly = false,    this.enabled = true,
    this.enablePasswordToggle = false,
 this.style,
    this.hintStyle,
    this.vertical =16,
    this.horizontal =24,
    this.textInputAction =TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.errorStyle = const  TextStyle(
                  color: ErrorTextForm,
                  fontSize: 12,
                ),
    this.errorBorderSide = const BorderSide(
                    width: 1,
                    color: ErrorTextForm,
                  ),
               this.suffixIcon,  
    this.controller,
    this.onSaved,
    this.errorText,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.inputFormatters,
    this.maxLines = 1,   
    this.maxLength,
     this.showCursor = true,  // 기본값을 true로 설정
    this.focusColor =GRAY800,
    this.enableColor =GRAY400,
    this.disableColor =GRAY400,
    this.height,    this.onSubmitted,  // 이 줄을 추가합니다
this.width,
this.autofocus = false,
  }) : super(key: key);

  @override
  _CustomLineAllTextFormFieldState createState() => _CustomLineAllTextFormFieldState();
}
class _CustomLineAllTextFormFieldState extends State<CustomLineAllTextFormField> {
  late bool _obscureText;
  String? _currentErrorText; // 에러 메시지를 저장할 변수

  @override
  void initState() {
        super.initState();
      _obscureText = widget.obscure ;
  }

    void _validateAndSetError(String value) {
    setState(() {
      _currentErrorText = widget.validator?.call(value); // validator 결과를 에러 메시지로 설정
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.vertical, horizontal: widget.horizontal),
      child: Container(
        
        height: widget.height,
        width: widget.width,
        child: TextFormField(
          
          style: widget.style ?? TextStyle(color: Colors.white, fontSize: 16),
          cursorColor: Colors.white,
          onFieldSubmitted: widget.onSubmitted,
          focusNode: widget.focusNode,
          onSaved: widget.onSaved,
          autofocus: widget.autofocus,
          onChanged: (value){
            widget.onChanged?.call(value);
            _validateAndSetError(value);
          },
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _obscureText,
          readOnly: widget.readOnly,
          enabled: !widget.readOnly,
          showCursor: widget.showCursor,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: widget.hintStyle ?? MyText().PRETENDARD_14_700_TEXT.copyWith(color: DARKMODE700, fontSize: 16),
            
            // 배경 및 테두리 스타일 - 검정 배경에 맞게 수정
            filled: true,
            fillColor: Colors.transparent,
            
            // 테두리 스타일 - 언더라인 형태로 변경
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            
            // 에러 텍스트 스타일
            errorStyle: TextStyle(color: Colors.red),
            
            // 패딩 조정
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            
            // 비밀번호 토글 아이콘 (필요한 경우)
            suffixIcon: widget.enablePasswordToggle
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}


class CustomTextFormField extends StatefulWidget {
  final String? hint;
  final bool obscure;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final double vertical;
  final double horizontal;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final double? height;
  final double? width;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final bool showCursor;
  final String? errorText;
  final bool enabled;
  final bool enablePasswordToggle;
  final TextStyle? errorStyle;
  final BorderSide? errorBorderSide;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool autofocus;
  final String? label;
  final bool isRequired;

  const CustomTextFormField({
    Key? key,
    this.hint,
    this.obscure = false,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.enablePasswordToggle = false,
    this.style,
    this.hintStyle,
    this.vertical = 24,
    this.horizontal = 0,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.errorStyle,
    this.errorBorderSide,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onSaved,
    this.errorText,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.showCursor = true,
    this.height,
    this.onSubmitted,
    this.width,
    this.autofocus = false,
    this.label,
    this.isRequired = false,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  String? _currentErrorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  void _validateAndSetError(String value) {
    setState(() {
      _currentErrorText = widget.validator?.call(value);
    });
  }

  bool get isEmpty => widget.controller?.text.isEmpty ?? true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.vertical,
        horizontal: widget.horizontal,
      ),
      child: Container(
        height: widget.height,
        width: widget.width,
        child: TextFormField(
          style: widget.style ?? MyText().NOTOSANS_16_500_TEXT.copyWith(
            color:DARKMODE100,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: DARKMODE100,
          onFieldSubmitted: widget.onSubmitted,
          focusNode: widget.focusNode,
          onSaved: widget.onSaved,
          autofocus: widget.autofocus,
          onChanged: (value) {
            widget.onChanged?.call(value);
            _validateAndSetError(value);
          },
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
            hintStyle: widget.hintStyle ?? MyText().NOTOSANS_16_500_TEXT.copyWith(color: DARKMODE500),
            filled: true,
            fillColor: Color(0xFF1E1E1E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: isEmpty && widget.isRequired
                  ? BorderSide(color: Color(0xFFFF0000), width: 1.5) // REDMODE
                  : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: isEmpty && widget.isRequired
                  ? BorderSide(color: Color(0xFFFF0000), width: 1.5) // REDMODE
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: isEmpty && widget.isRequired
                  ? BorderSide(color: Color(0xFFFF0000), width: 1.5) // REDMODE
                  : BorderSide.none
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFFF0000), width: 1.5), // REDMODE
            ),
            errorStyle: widget.errorStyle ?? TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 12,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.enablePasswordToggle
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: DARKMODE500,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}